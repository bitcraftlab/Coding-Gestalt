
class Sequencer {

  int xray;
  int speed = 20;
  OpenCV ocv;
  Rectangle[] faces;
  boolean[] inside;

  Sequencer(OpenCV ocv) {
    this.ocv = ocv;
    inside = new boolean[128];
  }

  void step() {

    // detect faces
    faces = opencv.detect();
    xray = (xray + speed) % w;
    
    for(int i = 0; i < faces.length; i++) {
      
      int x0 = faces[i].x;
      int y0 = faces[i].y;
      int x1 = x0 + faces[i].width;
      int y1 = y0 + faces[i].height;
      
      if(xray >= x0 && xray <= x1 && inside[i] == false) {
        // rectangle detected
        fill(255, 0, 0, 50);
        rect(x0, y0, x1 - x0, y1 - y0); 
        faceEntered(i, (y0 + y1) / 2);
        inside[i] = true;
      }
      
      if((xray < x0 || xray > x1) && inside[i] == true) {
        faceLeft(i, (y0 + y1) / 2);
        inside[i] = false;
      }
      
    }
    
  }

  void draw() {

    // draw rectangles around detected faces
    fill(255, 64);
    strokeWeight(3);
    stroke(0);
    
    for (int i = 0; i < faces.length; i++) {
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
    
    // show performance and number of detected faces on the console
    /*
    if (frameCount % 50 == 0) {
      println("Frame rate:", round(frameRate), "fps");
      println("Number of faces:", faces.length);
    }
    */


    // draw scanner
    line(xray, 0, xray, h);
  }
}

