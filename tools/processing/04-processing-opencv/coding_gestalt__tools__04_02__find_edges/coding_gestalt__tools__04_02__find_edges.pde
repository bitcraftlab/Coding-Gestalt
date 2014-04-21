import gab.opencv.*;
import processing.video.Capture;

OpenCV opencv;
Capture cam;

int zoom = 1;
int size = 3;
boolean invert = true;

// input resolution
int w = 160 * size, h = 120 * size;

void setup() {
  
  size(w * 2 * zoom, h * 2 * zoom);
  
  // init cam
  cam = new Capture(this, w, h);
  cam.start();
  
  // init opencv
  opencv = new OpenCV(this, w, h);
  
}


void draw() {
  
  opencv.loadImage(cam);
  
  scale(zoom);
  
  // top left
  PImage src = snapshot("original", 0, 0);
  
  // top right
  opencv.findCannyEdges(120, 75);
  if(invert) opencv.invert();
  snapshot("canny", 1, 0);
   
  // bottom left
  opencv.loadImage(src);
  opencv.findScharrEdges(OpenCV.HORIZONTAL);
  if(invert) opencv.invert();
  snapshot("scharr", 0, 1);
  
  // bottom right
  opencv.loadImage(src);
  opencv.findSobelEdges(1,0);
  if(invert) opencv.invert();
  snapshot("sobel", 1, 1);
  
}


// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}


// create a snapshot and display it
PImage snapshot(String label, int px, int py) {  
  
  // show image
  PImage img = opencv.getSnapshot();
  image(img, px * w, py * h);
  
  // draw label
  label(label, px * w + 20, py * h + 20);
 
  // image outline
  noFill(); stroke(invert ? 0 : 255); rect(px * w, py * h, w, h);
  
  // return the snapshot so we can reuse it
  return img;
}


// nice transparent label (black text on a white box)
void label(String txt, int x, int y) {
  
  int alpha = 200;
  int xgap = 8;
  int ygap = 2;
  int ta = int(textAscent());
  int th = int(textAscent() + textDescent());
  int tw = int(textWidth(txt));

  pushStyle();
  noStroke();
  fill(255, alpha); rect(x - xgap, y - ygap - ta, tw + 2 * xgap, th + 2 * ygap);
  fill(0, alpha); text(txt, x, y);
  popStyle();
  
}


void keyPressed() {
  invert = !invert; 
}

