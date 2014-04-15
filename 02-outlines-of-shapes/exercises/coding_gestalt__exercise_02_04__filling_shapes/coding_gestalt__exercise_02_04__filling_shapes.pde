///////////////////////////////////////////////////
//                                               //
//  CODING GESTALT  -   GESTALTING CODE          //
//  Lecture 02      -   Excercise 04             //
//                                               //
///////////////////////////////////////////////////
//                                               //
//                                               //
//                FILLING SHAPES                 //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  Implement a filling function in              //
//  >>> moore_fill.pde <<<                       //
//  that uses a moore neighborhood for filling   //
//  a region                                     //
//                                               //
///////////////////////////////////////////////////

import java.util.Stack;

color fg_color = #000000;
color bg_color = #ffffff;
color fill_color = #ff6666;
color track_color = #6666ff;

int speed = 100;
final int FALSE = 0, TRUE = 1, MAYBE = -1;
  
NeumannFill fl;

void setup() {
  size(500, 500);
  reset();
}

void reset() {
  
  // draw something to be filled
  background(bg_color);
  for(int i = 0; i < 20; i++) {
    
    float r = random(40, 100);
    float x = random(r, width - r);
    float y = random(r, height - r);
    
    fill(fg_color); noStroke();
    ellipse(x, y, r, r);
    fill(bg_color);
    ellipse(x, y, r/2, r/2);
    
  }
  
  // reset our fill tool
  fl = new NeumannFill();
  
}

void draw() {
  for(int i = 0; i < speed; i++) {
    
    int next = fl.hasNext();
    
    switch(next) {
      
      case TRUE:
       label("filling");
        int[] v = fl.getNext();
        set(v, fill_color);
      break;
      
      case MAYBE:
        label("backtracing");
        set(fl.pos, track_color);
        break;
        
      case FALSE:
        label("finished");
        break;
      
    }
  }
}


// modifying get + set to accomodate for vectors ( implemented as int[] arrays ) 
color get(int[] v) {
  return get(v[0], v[1]); 
}

void set(int[] v, color c) {
  set(v[0], v[1], c);
}


// draw a label
void label(String txt) {
  fill(bg_color); rect(0, 0, width, 40);
  fill(fg_color); text(txt, 20, 20); 
}

////////////////// interaction  ////////////////// 

void keyPressed() {
  reset(); 
}
void mousePressed() {
  fl.setStart(mouseX, mouseY);
}


