///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 02      -   Excercise 02             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//               FLIP FLOP CAMERA                //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  Implement the functions inside               //
//  >>> flip_flop.pde <<<                        //
//  so they flip and flop the camera image       //
//                                               //
///////////////////////////////////////////////////

// (c) YOUR_NAME at Bauhaus-Uni Weimar


import processing.video.Capture;
PFont arial;

Capture cam;
PImage img;

// display size + output zoom
int size = 2;
int zoom = 1;

// camera capture dimensions
int w = size * 160, h = size * 120;

void setup() {

  // space for 2 x 2 images
  size(w * zoom * 2 + 1, h * zoom * 2 + 1); 

  cam = new Capture(this, w, h);
  cam.start();
  
  setupDisplay();
  
}

void draw() {
 
  // scale it up
  scale(zoom);
  
  // get a snapshot from the camera
  PImage snap = cam.get();

  // top left
  show(snap, "original", 0, 0);

  // top right
  show(flip(snap), "flip", 1, 0);

  // bottom left
  show(flop(snap), "flop", 0, 1);

  // bottom right
  show(flip(flop(snap)), "flip flop", 1, 1);
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}


