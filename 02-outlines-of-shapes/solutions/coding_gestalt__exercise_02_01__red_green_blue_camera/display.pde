
// make sure to rescale font size and strokeweight
void setupDisplay() {
  textFont(createFont("", 10.0 / zoom));
  strokeWeight(1.0 / zoom);
}


// create a snapshot and display it
void show(PImage img, String label, int px, int py) {  
  
  float ymargin = 4.0 / zoom;
  float xmargin = 4.0 / zoom;
  
  // show image
  image(img, px * w, py * h);
  
  // draw label
  label(label, px * w + xmargin, py * h + ymargin);
 
  // image outline
  noFill(); stroke(0); rect(px * w, py * h, w, h);

}


// nice transparent label (black text on a white box)
void label(String txt, float x, float y) {
  
  int alpha = 200;
  float xpad = 16.0 / zoom;
  float ypad = 4.0 / zoom;
  float ta = textAscent();
  float th = textAscent() + textDescent();
  float tw = textWidth(txt);

  pushStyle();
  noStroke();
  fill(255, alpha); rect(x, y, tw + 2 * xpad, th + 2 * ypad);
  fill(0, alpha); text(txt, x + xpad, y + ypad + ta);
  popStyle();
  
}

