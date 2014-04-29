//////////////////////////////////////////////////////////////
//                                                          //
//           CODING GESTALT  -   GESTALTING CODE            //
//           Lecture 04      -   Demo 01                    //
//                                                          //
//////////////////////////////////////////////////////////////
//                                                          //
//                                                          //
//                   MOUNTAIN 3D                            //
//                                                          //
//                                                          //
//////////////////////////////////////////////////////////////
//                                                          //
//                                                          //
//   3D mountain (japanese mode) by LaT3x                   //
//   http://www.contextfreeart.org/gallery/view.php?id=15   //
//                                                          //
//////////////////////////////////////////////////////////////

// This is a demo, of how to translate a Contextfree Grammar
// into a Processing Program

// (c) Martin Schneider 2014

/// main ///

int i=0, imax=32, w=800;
float zoom = .3;

void setup() {
  size(w, w); smooth(); 
  noStroke(); noLoop();
}

void draw() {
  colorMode(HSB, TWO_PI, 1, 1, 1);
  background(0,0,1);
  translate(w/2,w/2); scale(w*zoom); 
  fill(h=0, s=0, b=0, a=1);  
  startshape(); 
}

void keyPressed() {
  redraw(); 
}


/// rules ///

// rule A { CIRCLE {} CIRCLE {b 1 s .99} A {x .1 s .75} }
// rule A { CIRCLE {} A {x .5 s .75} }
// rule B { A {} B {s .9 r 15} }
// rule B { A {r 180} B {s .9 r 15} } 

void startshape() {
  B(); 
}

void A() {
  if(i>=imax) return;
  switch(select(1,1)) {
    case 1:
      CIRCLE();
      push(); b(1); s(.99); CIRCLE(); pop();
      push(); x(.1); s(.75); A(); pop();
      break;
    case 2:
      CIRCLE();
      push(); x(.5); s(.75); A(); pop();
      break;
  }
}

void B() {
  if(i>=imax) return;
  switch(select(1,1)) {
    case 1:
      A();
      push(); r(15); s(.9); B(); pop();
      break;
    case 2:
      push(); r(180); A(); pop();
      push(); r(15); s(.9); B(); pop();
      break;
  }
}


