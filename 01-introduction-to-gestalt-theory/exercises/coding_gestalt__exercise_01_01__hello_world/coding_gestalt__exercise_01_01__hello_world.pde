
///////////////////////////////////////////////////
//                                               //
//      CODING GESTALT  -   GESTALTING CODE      //
//      Lecture 01      -   Excercise 01         //
//                                               //
///////////////////////////////////////////////////

// (c) YOUR_NAME at Bauhaus-Uni Weimar ( 2014 )

PFont arial;

void setup() {
  size(400, 400); 
  arial = loadFont("Arial-BoldMT-12.vlw");
  textFont(arial);
}

void draw() {
  background(255);
  fill(0);
  textAlign(CENTER);
  text("Hello World", width/2, height/2);
}
