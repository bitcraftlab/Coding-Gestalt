

void generate(int grammar, int depth) {

  Grammar gr = null;
  
  switch(grammar) {
    
    case 0: 
      
      // 2D Hilbert Curve
      gr = new SimpleGrammar(this, "A");
      gr.addRule('A', "-BF+AFA+FB-");
      gr.addRule('B', "+AF-BFB-FA+");
      break;
      
    case 1:

      // Peano Curve
      gr = new SimpleGrammar(this, "L");
      gr.addRule('L', "LFRFL-F-RFLFR+F+LFRFL");
      gr.addRule('R', "RFLFR+F+LFRFL-F-RFLFR");
      break;
      
    case 2: 
    
      // Box Fractal
      gr = new SimpleGrammar(this, "F-F-F-F");
      gr.addRule('F',"F-F+F+F-F");
      break;
      
   case 3:
   
      // 3D Hilbert Curve
      gr = new SimpleGrammar(this, "X");
      gr.addRule('X', "^<XF^<XFX-F^>>XFX&F+>>XFX-F>X->");
     
     break;
      
    default:
      return;
  
  }

  // generate
  gr.generateGrammar(depth);
  
  // assign it to the global turtle
  turtle = new Turtle(gr);
    
}
