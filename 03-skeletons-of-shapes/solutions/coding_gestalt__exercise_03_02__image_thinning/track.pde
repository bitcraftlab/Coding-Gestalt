
import java.util.Stack;

class Track {
  
  // use a stack, so we can push and pop points
  Stack<Point> tr = new Stack<Point>();
  
  // push a point to the trace
  void push(int x, int y) {
    tr.push(new Point(x, y));
  }
  
  // pop a point from the trace
  Point pop() {
    if(!tr.empty()) {
      return tr.pop();
    }
    return null;
  }
  
  boolean empty() {
    return tr.empty(); 
  }

  
  // draw the trace as a connected line
  
  void draw() {
    drawLines();
    drawPoints();
  }
  
  void drawPoints() {
    beginDraw();
    stroke(0); fill(255);
    for(Point p : tr) {
      ellipse(p.x, p.y, .7, .7);
    }
    endDraw();
  }
  
  
  void drawLines() {
    beginDraw();
    noFill(); smooth(16); stroke(0);
    beginShape();
    for(Point p : tr) {
       vertex(p.x, p.y);
    }
    endShape();
    endDraw();
  }
  
    
  void beginDraw() {
    pushStyle();
    pushMatrix();
    translate(0.5, 0.5);
    strokeWeight(0.05);
  }
  
  void endDraw() {  
    popMatrix();
    popStyle();
  }
  
  
}
