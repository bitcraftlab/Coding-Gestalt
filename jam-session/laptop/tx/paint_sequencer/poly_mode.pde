
class PolyMode extends BaseMode {

  ArrayList<PVector> selection = new ArrayList();
  
  String info() {
    return "Drawing Polys"; 
  }

  void drawCursor() {
    beginShape();
    cursorFill();
    for (PVector v : selection) {
      vertex(v.x * d, v.y * d);
    }
    vertex(mx * d, my * d);
    endShape(CLOSE);
  }

  void mousePressed() {
    if (!active) {
      mx1 = mx;
      my1 = my;
      selection.add(new PVector(mx, my));
      active = true;
    } 
    else {
      if (mx2 == mx && my2 == my) {
        closePoly();
      } 
      else {
        mx2 = mx;
        my2 = my;
        selection.add(new PVector(mx, my));
      }
    }
  }
  
  void closePoly() {

    // draw poly
    img.noSmooth();
    img.beginDraw();

    // call our fill function
    imgFill();
    
    pickColor();

    img.beginShape();
    for (PVector v: selection) {
      img.vertex(v.x - .5, v.y - .5);
    }
    img.endShape(CLOSE);
    img.endDraw();

    // clear selection
    selection = new ArrayList();
    active = false;
  }
  
  void imgFill() {
    img.noFill();
  }
  
  void cursorFill() { 
    noFill();
  }
  
}

class FillPolyMode extends PolyMode {
  
  String info() {
    return "Drawing Shapes"; 
  }
  
  void imgFill() {
    pickFillColor();
  }
  
  void cursorFill() {
    fill(cursorColor);
  }
  
}
