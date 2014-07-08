import processing.video.Capture;
import gab.opencv.OpenCV;
import java.awt.Rectangle;

Capture cam;
OpenCV opencv;

// input resolution
int w = 320, h = 240;

// output zoom
int zoom = 3;

Sequencer seq;



void setup() {

  // actual size, is a result of input resolution and zoom factor
  size(w * zoom, h * zoom);

  // capture camera with input resolution
  cam = new Capture(this, w, h);
  cam.start();

  // init OpenCV with input resolution
  opencv = new OpenCV(this, w, h);
  
  // init Sequencer
  seq = new Sequencer(opencv);

  // setup for facial recognition
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  setupOSC();
  
  // limit frameRate
  //frameRate(30);
}


void draw() {

  // get the camera image
  opencv.loadImage(cam);

  // zoom to input resolution
  scale(zoom);

  // draw input image
  image(opencv.getInput(), 0, 0);
  
  seq.step();
  seq.draw();
  
}

// read a new frame when it's available
void captureEvent(Capture c) {
  c.read();
}

void keyPressed() {
  faceEntered(0, 100); 
}
