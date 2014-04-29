
class ScanlineErosion implements Thinning {
  
  Track track;
  Scan scan;
  PImage image;
  Point point;
  
  color fg = color(0);
  color bg = color(255);
  
  
  ScanlineErosion(PImage img) {
    image = img;
    image.loadPixels();
    track = new Track();
    point = new Point(0, 0);
    scan = new RasterScan(image.width, image.height, point);
  }
  
  
  void step() {
    
    // set new scan position
    scan.setPos(point.x, point.y);

    if(scan.hasNext()) {
      
     // scan for the next foreground pixel
      while(image.pixels[scan.getX() + scan.getY() * image.width] != fg && scan.hasNext()) {
        point = scan.next();
      }
  
      // add the pixel position to the track
      track.push(point.x, point.y);
      
      // remove the point from the image
      img.pixels[scan.getX() + scan.getY() * image.width] = bg;
      
    }   
  }
  
  
  void back() {
    
    if(!track.empty()) {
      
      point = track.pop();
      
      // add the point to the the image
      img.pixels[point.x + point.y * image.width] = fg;
      
    }
  }
  
  void draw() {
    img.updatePixels();
    track.draw();
  }
  
}
