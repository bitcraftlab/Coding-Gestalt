
void setup() {
  size(1024, 200);
  setupOSC(); 
  setupMinim();
}


void draw() {
  
  fill(255, 10);
  rect(0, 0, width, height);
  stroke(0, 30);
  strokeWeight(6);
  
  int dy = height / 4;
  int y1 = dy;
  int y2 = height - dy;;

  // draw the waveforms scaled to the canvas size
  // the values returned by left.get() and right.get() will be between -1 and 1
  
  int n = out.bufferSize();
  for (int i = 0; i < bufferSize-1; i++) {
    float x1 = map( i, 0, n, 0, width );
    float x2 = map( i, 0, n, 0, width );
    line( x1, y1 + out.left.get(i)  * dy, x2, y1 + out.left.get(i+1)  * dy);
    line( x1, y2 + out.right.get(i) * dy, x2, y2 + out.right.get(i+1) * dy);
  }
}

void mousePressed() {
  // just for testing ( sound events should be triggered by OSC
  // soundEvent(mouseX, mouseY);
}
