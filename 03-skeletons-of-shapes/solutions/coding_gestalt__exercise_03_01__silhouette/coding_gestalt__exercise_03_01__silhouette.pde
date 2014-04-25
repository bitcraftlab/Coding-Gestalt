///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 03      -   Excercise 01             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//             DISPLAY THE SILHOUETTE            //
//                                               //
//                                               //
///////////////////////////////////////////////////


PImage img;

void setup() {
  img = loadImage("silhouette.png");
  size(img.width, img.height);
}

void draw() {
   image(img, 0, 0);
}

