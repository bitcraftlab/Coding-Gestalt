///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 02      -   Excercise 03             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//               FILTER CAMERA                   //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  Implement the functions inside               //
//  >>> filters.pde <<<                          //
//  so they flip and flop the camera image       //
//                                               //
///////////////////////////////////////////////////

// (c) YOUR_NAME at Bauhaus-Uni Weimar


import processing.video.Capture;

Capture cam;
PImage img;
boolean binarize;
int threshold = 120;

// display size + output zoom
int size = 2;
int zoom = 1;

// camera capture dimensions
int w = 160 * size, h = 120 * size;
float textHeight;

int multiple = 4;

void setup() {

  // space for 3 x 2 images
  size(w * zoom * 3 + 1, h * zoom * 2 + 1); 

  cam = new Capture(this, w, h);
  cam.start();
  
  // adjust display for zoom
  setupDisplay();
  
}

void draw() {
  
  scale(zoom);
  
  // get a snapshot from the camera
  PImage snap = cam.get();
  
  // use grayscale or black & white image as source
  PImage src = binarize ? threshold(snap, threshold) : grayscale(snap);
  
  // top left
  show(src, "original", 0, 0);

  // top center
  PImage dilated = dilate(src, multiple);
  show(dilate(src, multiple), "dilate " + multiple, 1, 0);

  // top right
  PImage eroded = erode(src, multiple);
  show(erode(src, multiple), "erode " + multiple , 2, 0);

  // bottom center
  show(dilate(eroded, multiple), "dilate " + multiple + " + erode " + multiple, 1, 1);
  
  // bottom right
  show(erode(dilated, multiple), "erode " + multiple + " + dilate " + multiple, 2, 1);
 

  
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  binarize = !binarize; 
}

