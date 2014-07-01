
class Sequencer {
    
  ArrayList<Rectangle> rectangles = new ArrayList();

  void addRectangle(int x, int y) {
     rectangles.add(new Rectangle(x, y));
  }
  
  void draw() {
    for(Rectangle r : rectangles) {
      r.draw(); 
    } 
  }
  
  void mouseClicked() {
    for(Rectangle r : rectangles) {
      if(r.inside(mouseX, mouseY)) {
        r.mouseClicked();
      } 
    }
  }
  
}
