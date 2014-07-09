
PGraphics img;
int d = 8;
int w, h;
float mx, my;

boolean lineMode;
boolean showGrid = true;
color cursorColor = color(255, 0, 0, 100);
int framesPerStep = 10;

Mode mode = new PaintMode();
Sequencer seq;

void setup() {
  size(512, 512);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  setupOSC();
  reset();
}

void draw() {

  background(255);
  noSmooth();
  image(img, 0, 0, w * d, h * d);

  // update mouse coordinates
  mode.update();
  
  // draw sequencer every n'th frame
  if(frameCount % framesPerStep == 0) {
    seq.step();
  }
  seq.draw();

  
  // draw headline
  fill(255, 0, 0, 200);
  noStroke();
  rect(0, 0, width, 30);
  fill(255);
  text(mode.info().toUpperCase(), 20, 20);
    

  
  // draw the cursor
  smooth();
  strokeWeight(d);
  stroke(cursorColor);
  mode.drawCursor();
  
  // draw the grid
  if(showGrid) {
    strokeWeight(1);
    stroke(0, 50);
    for(int x = 0; x <= w; x++) {
      line(x * d, 0, x * d, height);
    } 
    for(int y = 0; y <= h; y++) {
      line(0, y * d, width, y * d);
    }
  }

 
}

void reset() {
  
  mode.resetCursor();
  w = ceil(float(width / d));
  h = ceil(float(height / d));
  img = createGraphics(w, h);
  img.beginDraw();
  img.endDraw();
  lineMode = false;
  
  seq = new Sequencer(img);
  
  
}

void mousePressed() {
  mode.mousePressed();
}

void mouseDragged() {
  mode.mouseDragged(); 
}

void mouseReleased() {
  mode.mouseReleased(); 
}

void keyPressed() {
  switch(key) {
  
  case '1': mode = new PaintMode(); break;
  case '2': mode = new LineMode(); break;
  case '3': mode = new PolyMode(); break;
  case '4': mode = new FillPolyMode(); break;
  case '5': mode = new PointMode(); break;


  case ' ': mode.resetCursor(); break;  
  case 'r': reset(); break;
  case '+': d *=2; reset(); break;
  case '-': d /=2; reset(); break;
  case '#': showGrid = !showGrid; break;
  }
}

