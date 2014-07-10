
class Sequencer {

  int xray, pxray;
  PImage img;
  int speed = 1;

  Sequencer(PImage img) {
    this.img = img;
  }

  void step() {
    
    xray = (xray + speed + w) % w;
    
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
  
  void scanLeft() {
    speed = -1; 
  }
  
  void scanRight() {
    speed = +1; 
  }
  
  void draw() {
    noFill();
    stroke(255, 0, 0);
    rect(d * int(xray), 0, d, height); 
  }
  
}

