
class LineMode extends BaseMode {

  String info() {
    return "Drawing Lines"; 
  }
  
  void drawCursor() {
    line(mx1 * d, my1 * d, (lineMode ? mx : mx2) * d, (lineMode ? my : my2) * d);
  }

  void mousePressed() {
    if (!lineMode) {
      mx1 = mx;
      my1 = my;
    } 
    else {
      mx2 = mx;
      my2 = my;
      img.noSmooth();
      img.beginDraw();
      pickColor();
      img.line(mx1 - .5, my1 -.5, mx2 -.5, my2 - .5);
      img.endDraw();
    }
    lineMode = !lineMode;
  }
} 

