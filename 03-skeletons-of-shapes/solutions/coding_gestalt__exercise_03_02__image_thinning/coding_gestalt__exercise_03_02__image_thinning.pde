///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 03      -   Excercise 02             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//                 IMAGE THINNING                //
//                                               //
//                                               //
///////////////////////////////////////////////////

CanvasCam cam;
PImage img;

Thinning thin;
int dir = 1;
int maxsteps = 16;
int steps = maxsteps;


void setup() {
  img = loadImage("silhouette.png");
  size(displayWidth, displayHeight);
  cam = new CanvasCam(this, 1);
  reset();
}


void reset() {
  thin = new ScanlineErosion(img);
  cam.reset();
}


void draw() {
 
  background(0);

  // move the image to the center of the screen
  translate(width/2 - img.width/2, height/2 -img.height/2);
  
  // fsteps
  for(int i = 0; i < steps; i++) {
     if(dir > 0) thin.step(); 
     if(dir < 0) thin.back();
  }

  // draw pixels in the background
  noSmooth();
  image(img, 0, 0); fill(200, 200, 255, 200); noStroke(); rect(0, 0, img.width+1, img.height+1);
      
  smooth(16);
  thin.draw();

}

void keyPressed() {
  
  switch(key) {
    
    case 'r': reset(); break;
    case '+': cam.zoomBy(sqrt(2)); break;
    case '-': cam.zoomBy(1.0 / sqrt(2)); break;
    
    case '1': steps = 1; break;
    case '2': steps = 8; break;
    case '3': steps = 8*8; break;
    case '4': steps = 8*8*8; break;
    case '5': steps = 8*8*8*8; break;
    
    case ' ': dir = 0; break;
   
    case CODED:
      switch(keyCode) {
        case RIGHT:  dir = 0; thin.step(); break;
        case LEFT: dir = 0; thin.back(); break; 
        case DOWN: dir = 1; break;
        case UP: dir = -1; break;
      }
      break;
    }
        
}

void mousePressed() {
}

