
///////////////////////////////////////////////////
//                                               //
//                                               //
//         LAPTOP CHESS BOARD SENDER             //
//                                               //
//                                               //
///////////////////////////////////////////////////
//                                               //
//  This is an example of how to map the (x, y)  //
//  output of a function to cell touch events.   //
//                                               //
//  The events are emmited via OSC.              //
//  And are interpreted by the receiver sketch.  //
//                                               //
///////////////////////////////////////////////////


int nx = 8, ny = 8;
int stroke = 6;
int gap = 1;
int dx, dy;
int x0, y0;
int alpha = 10;
color hilite = #ff0000;

// display modes
boolean showTrail = true;
boolean showHilite = true;

// previous cell
int pcellX, pcellY; 

// current cell
int cellX, cellY;

PGraphics board, tmp;
int NO_CELL = -1;

void setup() {

  // nice and big
  size(400, 400);

  // remove a single gap
  int w0 = width - gap ;
  int h0 = height - gap;

  // side length of a single square (including gap)
  dx = w0 / nx;
  dy = h0 / ny;

  // offset origin so we get a balanced border
  x0 = gap + int(w0 - (dx * nx)) / 2;
  y0 = gap + int(h0 - (dy * ny)) / 2;

  board = createGraphics(width, height);

  // prepare the board
  beginGraphics(board);
  strokeJoin(ROUND);
  background(204);
  endGraphics();
  
  // open sound control
  setupOSC();
  
}



void draw() {

  // draw chess board with fade out
  beginGraphics(board);
  drawChessboard(alpha);
  if (showTrail) {
    pushStyle();
    smooth(16);
    stroke(255);
    strokeWeight(stroke);
    line(pmouseX, pmouseY, mouseX, mouseY);
    popStyle();
  }
  endGraphics();

  // display the board
  image(board, 0, 0);

  // display the cursor on top

  if (showHilite && 
    cellX >= 0 && cellX < nx &&
    cellY >= 0 && cellY < ny
    ) {
    fill(hilite, 80);
    noStroke();
    drawCell(cellX, cellY);
  }
}


// there should be no difference between dragging and moving the mouse
void mouseDragged() {
  mouseMoved(); 
}


// interaction between mouse pointer and cells
void mouseMoved() {
  
  pcellX = cellX;
  pcellY = cellY;

  int x = mouseX - x0;
  int y = mouseY - y0;

  if ((x + dx) % dx < dx - gap) {
    cellX = x / dx;
  } 
  else {
    cellX = NO_CELL;
  }

  if ((y + dy) % dy < dy - gap) {
    cellY = y / dy;
  } 
  else {
    cellY = NO_CELL;
  }
  
  // check if cell coords have changed at all
  if(cellX != pcellX || cellY != pcellY) {
    
    // check if we left a cell
    if(pcellX != NO_CELL && pcellY != NO_CELL) {
      cellLeft(pcellX, pcellY); 
    }
        
    // ceck if we entered a new cell
    if(cellX != NO_CELL && cellY != NO_CELL) {
       cellEntered(cellX, cellY);  
    }
  }
  
}


// keyboard interaction
void keyPressed() {
  switch(key) {
  case 't':
    showTrail = !showTrail;
    break;
  case 'h':
    showHilite = !showHilite;
    break; 
  }
}


// temporarily switch the canvas
void beginGraphics(PGraphics gg) {
  tmp = g;
  g = gg;
  g.beginDraw();
}

// switch back to the original canvas
void endGraphics() {
  g.endDraw();
  g = tmp;
}


void drawChessboard(int alpha) {
  noStroke();
  fill(130, alpha);
  rect(0, 0, width, height);
  for (int y = 0; y < ny; y++) {
    for (int x = 0; x < nx; x++) {
      int cell = (x + y) % 2; // chess board pattern
      color c = cell * 110;
      fill(c, alpha);
      drawCell(x, y);
    }
  }
}


void drawCell(int x, int y) {
  pushMatrix();
  translate(x0 + x * dx, y0 + y * dy);
  rect(0, 0, dx - gap, dy - gap);
  popMatrix();
}

