///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 02      -   Excercise 01             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//            RED GREEN BLUE CAMERA              //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  Implement the functions inside               //
//  >>> red_green_blue.pde <<<                   //
//  so they show the RGB components              //
//  of the camera image                          //
//                                               //
///////////////////////////////////////////////////

// (c) YOUR_NAME at Bauhaus-Uni Weimar


import processing.video.Capture;
PFont arial;

Capture cam;
PImage img;

// camera size + output zoom
int size = 3;
int zoom = 1;

// camera capture dimensions
int w = 160 * size, h = 120 * size;

void setup() {

  // space for 2 x 2 images
  size(w * zoom * 2 + 1, h * zoom * 2 + 1); 

  cam = new Capture(this, w, h);
  cam.start();
  
  setupDisplay();
  
}

void draw() {
  
  // get a snapshot from the camera
  PImage snap = cam.get();

  // top left
  show(snap, "original", 0, 0);

  // top right
  show(red(snap), "red", 1, 0);

  // bottom left
  show(green(snap), "green", 0, 1);

  // bottom right
  show(blue(snap), "blue", 1, 1);
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}


