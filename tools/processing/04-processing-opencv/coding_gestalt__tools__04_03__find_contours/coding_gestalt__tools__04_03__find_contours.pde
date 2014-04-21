
import processing.video.Capture;
import gab.opencv.OpenCV;
import gab.opencv.Contour;

Capture cam;
OpenCV opencv;

// input resolution
int w = 320, h = 240;

// output zoom
int zoom = 3;

// target frameRate
int fps = 30;

// contour threshold ( 0 .. 255)
int threshold = 100;

// display options
boolean showContours = true;
boolean showOutput;
boolean showPolys;

// drawing style
boolean fillShapes = true;
color contourColor = color(255, 50, 50, 150);
color polyColor = color(50, 255, 50, 150);


// counting the number of snapshots
int snapCount;


void setup() {

  // actual size is a result of input resolution and zoom factor
  size(w * zoom, h * zoom);

  // limit redrawing to the target frame rate
  frameRate(fps);
  
  // capture camera with input resolution and target frame rate
  cam = new Capture(this, w, h, fps);
  cam.start();

  // init OpenCV with input resolution 
  opencv = new OpenCV(this, w, h);
  opencv.gray();
  
  // drawing style
  smooth();
  strokeWeight(2);
  strokeJoin(ROUND);



}


void draw() {

    background(255);

    // read a single frame
    opencv.loadImage(cam);

    // init OpenCV for thresholding
    opencv.gray();
    opencv.threshold(threshold);

    // find contours
    ArrayList<Contour> contours = opencv.findContours();

    // zoom to input resolution
    scale(zoom);
         
    // get output image
    PImage output = opencv.getOutput();

    // Show camera or OpenCV input
    image(showOutput ? output : cam, 0, 0);


    // draw on top of output image
    for (Contour contour : contours) {
      
      fill(255, fillShapes ? 150 : 0);
      // draw the contour
      if (showContours) {
        stroke(contourColor);
        contour.draw();
      }

      // draw a polygonal approximation
      if (showPolys) {
        stroke(polyColor);
        beginShape();
        for (PVector point : contour.getPolygonApproximation().getPoints()) {
          vertex(point.x, point.y);
        }
        endShape(CLOSE);
      }
    }

    // show performance and number of detected contours on the console
    if (snapCount % 10 == 0) {
      println("======= Frame:" + nfs(snapCount, 5), "=======");
      println("Threshold: ", threshold);
      println("Camera frame rate:", round(cam.frameRate), "fps");
      println("Sketch frame rate:", round(frameRate), "fps");
      println("Number of contours:", contours.size());
    }
    
    // count number of snapshots taken and processed
    snapCount++;
  
  
}

  
void captureEvent(Capture cam) {
    cam.read();
}



//////// user interaction ////////

void keyPressed() {

  switch(key) {

    case '+':
      threshold += 10;
      break;
  
    case '-':
      threshold -= 10;
      break;
  
    case 'o':
      showOutput = !showOutput;
      return;
  
    case 'c':
      showContours = !showContours;
      return;
  
    case 'p':
      showPolys = !showPolys;
      return;
      
    case 'f':
      fillShapes = !fillShapes;
      return;
      
  }

  // constrain threshold to the valid domain
  threshold = constrain(threshold, 0, 255);
  
  // update OpenCV threshold settings
  opencv.threshold(threshold);

}

