
class Sequencer {

  int xray, pxray;
  int speed = 1;
  PImage img;

  Sequencer(PImage img) {
    this.img = img;
  }

  void step() {
    
    xray = (xray + speed) % w;
    
    // call pixel left for previous columt
    for (int y = 0; y < img.height; y++) {
      if (img.get(int(pxray), y) == color(0)) {
        pixelLeft(pxray, y);
      }
    }
    
    // call pixel entered for current column
    for (int y = 0; y < img.height; y++) {
      if (img.get(int(xray), y) == color(0)) {
        pixelEntered(xray, y);
      }
    }

    pxray = xray;

  }
  
  void draw() {
    noFill();
    stroke(255, 0, 0);
    rect(d * int(xray), 0, d, height); 
  }
  
}

