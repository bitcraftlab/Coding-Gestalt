
// a point is a pair of integers
class Point {
  
  int x, y;
  
  Point(int px, int py) {
     x = px; y = py;
  }
  
  Point(Point p) {
     x = p.x; y = p.y; 
  }
  
  public String toString() {
    return x + " " + y; 
  }
}

