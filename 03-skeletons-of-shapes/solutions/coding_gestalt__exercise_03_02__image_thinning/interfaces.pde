
interface Thinning {
 
  void step(); // move one step ahead
  void back(); // move one step back
  void draw(); // draw a line
  
}


interface Scan {

  boolean hasNext();    // is there a next point?
  boolean hasPrev();    // is there a previous point?
  
  Point next();    // get the next point
  Point prev();    // get the previous point
  
  void setPos(int x, int y); // set current coordinates
  int getX();       // return current X coordinate
  int getY();       // return current Y coordinate
  
}
