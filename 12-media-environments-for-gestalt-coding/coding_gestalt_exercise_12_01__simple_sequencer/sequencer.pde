
class Sequencer {

  int activeCol;

  Rectangle[][] rectangles = new Rectangle[cols][rows];

  void addRectangle(int x, int y) {
    rectangles[x][y] = new Rectangle(x, y);
  }

  void step() {
    activeCol = (activeCol + 1) % cols;
    
    
    // trigger sound events
    int x = activeCol;
    for(int y = 0; y < rows; y++) {
      Rectangle r = rectangles[x][y];
      if(r.active) {
        cell(x, y);
      } 
    }
    
  }

  void draw() {
    
    // draw boxes
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) { 
        rectangles[x][y].draw();
      }
    }
    
    // draw scanner
    noFill();
    strokeWeight(10);
    
    int x = activeCol;
    rect(x * dx, 0, dx, height);


  }

  void mouseClicked() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        Rectangle r = rectangles[x][y];
        if (r.inside(mouseX, mouseY)) {
          r.mouseClicked();
        }
      }
    }
    
  }
}

