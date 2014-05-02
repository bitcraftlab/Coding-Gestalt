

// example of a raster scan class
// it walks top left to bottom right
// wrapping over until all pixels are covered

class RasterScan implements Scan {

  Point pos, start;
  int width, height;
  int idx, cmax;
  int count;


  RasterScan(int w, int h, Point p) {
    width = w;
    height = h;
    pos = new Point(p);
    start = new Point(p);
    cmax = width * height;
  }
  
  void setPos(int x, int y) {
     pos.x = x;
     pos.y = y;
  }
  
  int getX() {
    return pos.x; 
  }
  
  int getY() {
    return pos.y; 
  }

  boolean hasNext() {
    return count < cmax - 1;  
  }
  
  boolean hasPrev() {
    return count > 0; 
  }
  
  Point next() {

    // scan all pixels once
    if (hasNext()) {
      
      ++count;

      // increase x position
      if (++pos.x >= width) {
        
        // back to the left side
        pos.x = 0;
        
        // increase y position
        if (++pos.y >= height) {
          
          // back to the top
          pos.y = 0;
          
        }
      }
    } 
    
    return pos;
   
  }
  

  
  Point prev() {
    
    if (hasPrev()) {
      
      --count;
      
       // decrease x position
      if (--pos.x < 0) {
        
        // back to the right side
        pos.x = width - 1;
        
        // decrease y position
        if (--pos.y < 0) {
          
          // back to the bottom
          pos.y = height - 1;
          
        }
        
       
      }

    }
    
    return pos;
      
  }
  
}

