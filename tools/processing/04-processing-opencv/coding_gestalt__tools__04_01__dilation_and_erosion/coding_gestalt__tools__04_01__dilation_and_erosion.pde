import gab.opencv.*;
import processing.video.Capture;

OpenCV opencv;
Capture cam;

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
  
  // init opencv
  opencv = new OpenCV(this, w, h);
  
}


void draw() {
  
  scale(zoom); 
  opencv.loadImage(cam);
  
  // possibly create a black and white image
  if(binarize) {
    opencv.gray();
    opencv.threshold(threshold);
    // opencv.invert();
  }
    
  // top left
  PImage original = snapshot("original", 0, 0);
  
  // top center
  erode(multiple);
  PImage eroded = snapshot("erode " + multiple, 1, 0);

  // top right
  opencv.loadImage(original);
  dilate(multiple);
  snapshot("dilate " + multiple , 2, 0);
  
  // bottom center
  erode(multiple);
  snapshot("dilate " + multiple + " + erode " + multiple, 1, 1);
  
  // bottom right
  opencv.loadImage(eroded);
  dilate(multiple);
  snapshot("erode " + multiple + " + dilate " + multiple, 2, 1);
  

}

// create a snapshot and display it
PImage snapshot(String label, int px, int py) {  
  
  // show image
  PImage img = opencv.getSnapshot();
  image(img, px * w, py * h);
  
  // draw label
  label(label, px * w + 20, py * h + 20);
 
  // image outline
  noFill(); stroke(255); rect(px * w, py * h, w, h);
  
  // return the snapshot so we can reuse it
  return img;
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
    opencv.dilate();
  } 
}

void erode(int n) {
  for(int i = 0; i < n; i++) {
    opencv.erode();
  } 
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}


void keyPressed() {
  
  switch(key) {
    
    case ' ':
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

