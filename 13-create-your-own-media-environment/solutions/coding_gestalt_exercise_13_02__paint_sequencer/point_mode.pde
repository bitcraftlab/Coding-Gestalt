
class PointMode extends BaseMode {

  String info() {
    return "Picking Points";
  }
  
  void drawCursor() {
     point(mx * d, my * d); 
  }

  void mousePressed() {
    img.noSmooth();
    img.beginDraw();
    img.stroke(0);
    img.point(mx - .5, my -.5);
    img.endDraw();
  }
} 

