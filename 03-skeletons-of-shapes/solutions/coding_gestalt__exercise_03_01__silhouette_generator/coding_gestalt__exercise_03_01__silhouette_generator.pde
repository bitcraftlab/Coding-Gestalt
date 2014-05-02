///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 03      -   Excercise 01             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//             CREATE A SILHOUETTE               //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  1. Loading the stanford Bunny as OBJ into    //
//     Processing.                               //   
//  2. Drawing it black on a white background.   //
//  3. Saving it with the saveFrame function     //
//                                               //
///////////////////////////////////////////////////


import peasy.PeasyCam;

PShape shp;
PeasyCam cam;
float w, h, zoom;
int maxFlash = 10;
int flash;

void setup() {
  
  // screen size of 400x400 
  size(400, 400, P3D);
  
  // camera at a distance of 600 pixels
  cam = new PeasyCam(this, 600);
  
  // get that stanford bunny
  shp = loadShape("bunny.obj");
  shp.rotateX(PI);
  
  // get bunny dimensions
  h = shp.getHeight();
  w = shp.getWidth();

  // move its origin
  shp.translate(w/4 ,h * 3/4, 0);
  
  // minimum of screen to rabbit ratio
  zoom = min(width / w, height / h);
  
  // scale the shape to screen size
  shp.scale(zoom);
  
  // follow the white rabbit!
  shp.setFill(color(255));
 
}


void draw() {

  // if there is no flash, use normal lights
  if(flash == 0) {
    
    // black background
    background(0);
    
    // follow the white rabbit!
    shp.setFill(color(255));
    
    // lights should be relative to the viewer (not the model)
    cam.beginHUD();
    lights();
    cam.endHUD(); 
    
    // display the rabbit
    shape(shp);
    
  } else {
    
    // make sure we only get only black and white pixels (no anti aliasing)
    noSmooth();
  
    // white background
    background(255);
    
    // black silhouette
    shp.setFill(color(0));
    
    // display the rabbit 
    shape(shp);
    
    // save the image 
    if(flash == maxFlash) saveFrame("output/silhouette-#####.png");
    
    // dim the flash
    flash--;
    
  }
  
}

void keyPressed() {
    flash = maxFlash;
}
  
  
