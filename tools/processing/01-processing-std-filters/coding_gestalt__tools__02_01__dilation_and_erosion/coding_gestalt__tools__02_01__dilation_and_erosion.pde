
import processing.video.Capture;

Capture cam;
PImage snap;

int multiple = 3;
boolean binarize;
int threshold = 100;

int zoom = 1;
int size = 3;

// input resolution
int w = 160 * size, h = 120 * size;

void setup() {
  
  size(w * 3 * zoom, h * 2 * zoom);
  
  // init cam
  cam = new Capture(this, w, h);
  cam.start();
 
}


void draw() {
  
  scale(zoom); 
  
  PImage orig = getImage(cam);
  
  // possibly create a black and white image
  if(binarize) {
    
    orig.filter(THRESHOLD, threshold / 255.0);
    // orig.filter(INVERT);

  }
    
    
  // top left
  getImage(orig);
  show("original", 0, 0);
  
  // top center
  PImage eroded = getImage(orig);
  erode(multiple);
  show("erode " + multiple, 1, 0);

  // top right
  PImage dilated = getImage(orig);
  dilate(multiple);
  show("dilate " + multiple , 2, 0);
  


  // bottom center
  getImage(eroded);
  dilate(multiple);
  show("erode " + multiple + " + dilate " + multiple, 1, 1);
  
  // bottom right
  getImage(dilated);
  erode(multiple);
  show("dilate " + multiple + " + erode " + multiple, 2, 1);
  
  
  

}


PImage getImage(PImage src) {
  snap = src.get(); 
  return snap;
}

// create a snapshot and display it
void show(String label, int px, int py) {  
  
  // show image
  image(snap, px * w, py * h);
  
  // draw label
  label(label, px * w + 20, py * h + 20);
 
  // image outline
  noFill(); stroke(255); rect(px * w, py * h, w, h);

}


// nice transparent label (black text on a white box)
void label(String txt, int x, int y) {
  
  int alpha = 200;
  int xgap = 8;
  int ygap = 2;
  int ta = int(textAscent());
  int th = int(textAscent() + textDescent());
  int tw = int(textWidth(txt));

  pushStyle();
  noStroke();
  fill(255, alpha); rect(x - xgap, y - ygap - ta, tw + 2 * xgap, th + 2 * ygap);
  fill(0, alpha); text(txt, x, y);
  popStyle();
  
}

void dilate(int n) {
  for(int i = 0; i < n; i++) {
    snap.filter(DILATE);
  } 
}

void erode(int n) {
  for(int i = 0; i < n; i++) {
    snap.filter(ERODE);
  } 
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}


void keyPressed() {
  
  switch(key) {
    
    case 'b':
      binarize = !binarize;
      return;
      
    case '+':
      threshold += 1;
      break;
      
    case '-':
      threshold -= 1;
      break;
    
    // arrow keys
    case CODED:
      switch(keyCode) {
        
        case UP:
          threshold += 10;
          break; 
          
        case DOWN:
          threshold -= 10;
          break; 
  
      }
      break;
      
    // number keys
    default:
      if(key >= '0' && key <= '9') {
        multiple = (key - '0');
        return;
      }
      
  }
  
  binarize = true;
  threshold = constrain(threshold, 0, 255);
  
}

