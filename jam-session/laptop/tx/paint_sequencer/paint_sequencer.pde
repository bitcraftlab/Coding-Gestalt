
PGraphics img;
int d = 8;
int w, h;
float mx, my;

boolean lineMode;
boolean showGrid = true;
color cursorColor = color(255, 0, 0, 100);
int framesPerStep = 10;
boolean sendSnapshots;

Mode mode = new PaintMode();
Sequencer seq;
SnapshotSender ss;

void setup() {
  size(500, 500);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  setupOSC();
  ss = new SnapshotSender();
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

  // send Snapshots to MART
  if(sendSnapshots) {
    sendSnapshot();
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
  case 'd': mode = new PaintMode(); break;
  case 'l': mode = new LineMode(); break;
  case 'p': mode = new PolyMode(); break;
  case 'f': mode = new FillPolyMode(); break;
  case '.': mode = new PointMode(); break;


  case ' ': mode.resetCursor(); break;  
  case 'r': reset(); break;
  case '+': d *=2; reset(); break;
  case '-': d /=2; reset(); break;
  case '#': showGrid = !showGrid; break;
  
  case 'S': saveSequence(); break;
  case 'L': loadSequence(); break;
  
  case 'X': 
    sendSnapshots = !sendSnapshots;
    break;
  
  case CODED: switch(keyCode) {
    case UP:
      framesPerStep--;
      break;
    case DOWN:
      framesPerStep++;
      break;
    case LEFT:
      seq.scanLeft();
      break;
    case RIGHT:
      seq.scanRight();
      break;
    }
    framesPerStep = constrain(framesPerStep, 1, 30);
  
  }
  
  oscKeyPressed(key);
  
}

void saveSequence() {
  img.save("snapshot.png");  
}

void loadSequence() {
  img.beginDraw();
  img.background(255);
  img.image(loadImage("snapshot.png"), 0, 0);
  img.endDraw();
}

void sendSnapshot() {
   // send a snapshot to MART
   PImage snap = get(0, 0, 500, 500);
   ss.send(snap, getInetAddress(remoteprefix + osc_id[0]), snapshotport);
}

