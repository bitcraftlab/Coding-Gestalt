
class PaintMode extends BaseMode {

  String info() {
    return "Painting Pixels";
  }

  // no cursor for drawing
  void drawCursor() {};

  void mousePressed() {
    mx1 = mx;
    my1 = my; 
    active = true;
    mouseDragged();
  }

  void mouseDragged() {
    img.noSmooth();
    img.beginDraw();
    pickColor();
    img.line(mx1 - .5, my1 -.5, mx -.5, my - .5);
    img.endDraw();
    mx1 = mx;
    my1 = my;
  }

  void mouseReleased() {
    active = false;
  }
} 

