///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 05      -   Exercise 02              //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//               10 PRINT CAMERA                 //
//                                               //
//                                               //
///////////////////////////////////////////////////

// (c) YOUR_NAME at Bauhaus-Uni Weimar

import processing.video.Capture;
Capture cam;

int boxsize = 100;

void setup() {
  size(600, 600);
  cam = new Capture(this, 320, 240);
  cam.start();
  stroke(200);
}


void draw() {
 
  background(0);
  randomSeed(0);
  

  int ymax = width / boxsize + 1;
  int xmax = height / boxsize + 1;
  noStroke();
  

  for(int y = 0; y < ymax; y++) {
    for(int x = 0; x < xmax; x++) {
      pushMatrix();
      translate(x * boxsize, y * boxsize);
      element(boxsize, random(1));
      popMatrix();
    } 
  } 
  
}


void element(int boxsize, float val) {
   if(val > 0.5) {
     
     copy(cam.get(), 0, 0, boxsize, boxsize, 0, 0, boxsize, boxsize );
     
   } else {
     
     pushMatrix();
     translate(0, boxsize);
     scale(1,-1);
     copy(cam.get(), 0, 0, boxsize, boxsize, 0, 0, boxsize, boxsize );
     popMatrix();
     
   }
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}

