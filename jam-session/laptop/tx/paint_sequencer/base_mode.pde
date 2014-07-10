
interface Mode {
  void drawCursor();
  void mousePressed();
  void mouseDragged();
  void mouseReleased();
  void resetCursor();
  void update();
  String info();
}

class NoMode implements Mode {
  void drawCursor() {}
  void mousePressed() {}
  void mouseDragged() {}
  void mouseReleased() {}
  void resetCursor() {}
  void update() {}
  String info() {
    return "Select a Mode"; 
  }
}

abstract class BaseMode implements Mode {
  
  float mx, my;   // current mouse coordinates in pixel space
  float mx1, my1; // mouse memory 1
  float mx2, my2; // mouse memory 2
  boolean active;
  
  String info;
  
  void update() {
    // update pixel mouse coordinates
    mx = int(mouseX / d) + .5;
    my = int(mouseY / d) + .5;  
  }
    
  void resetCursor() {
    mx1 = my1 = mx2 = my2 = -1;
  }
  
  void pickColor() { 
    boolean shiftPressed = (keyPressed && keyCode == SHIFT);
    img.stroke(shiftPressed ? 255 : 0); 
  }
  
  void pickFillColor() {
    boolean shiftPressed = (keyPressed && keyCode == SHIFT);
    img.fill(shiftPressed ? 255 : 0); 
  }
    
  void mouseDragged() {}
  void mouseReleased() {}
  
}

