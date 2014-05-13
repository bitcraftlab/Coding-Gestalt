

final int RECTILE = 0, FTILE = 1, MYTILE = 2;
int sym = 1;
int d = 100;

PMatrix m;
int tile = FTILE;
boolean showOutline = true;


void setup() {

  size(500, 500);
  m = new PMatrix3D();
}


void draw() {

  background(100);
  translate(0, 200);

  for (int i=0; i<5; i++) {

    fill(lerpColor(#ff6666, #ffffff, i / 5.0));
    PMatrix m = getSymmetry(sym, i);
    drawTile(tile, m, d);
  }
}


void drawTile(int tile, PMatrix m, float d) {

  switch(tile) {

  case RECTILE: 

    // simple rectangle

    pushMatrix();
    scale(d);
    strokeWeight(1.0 / d);
    applyMatrix(m);
    rect(0, 0, 1, 1);
    popMatrix();

    break;

  case FTILE:

    // F-shape

    // scale to unit size
    pushMatrix();
    scale(d);

    // now apply the matrix
    applyMatrix(m);

    // rescale vertices
    scale(1.0 / 9.0);
    strokeWeight(9.0 / d);

    // white background rectangle
    if (showOutline) {
      pushStyle();
      fill(255); 
      rect(0, 0, 9, 9);
      popStyle();
    }

    // black f-shape
    beginShape();
    vertex(2, 1); 
    vertex(7, 1); 
    vertex(7, 2); 
    vertex(3, 2); 
    vertex(3, 4); 
    vertex(7, 4); 
    vertex(7, 5); 
    vertex(3, 5); 
    vertex(3, 8); 
    vertex(2, 8);
    endShape(CLOSE);

    popMatrix();

    break;

  case MYTILE:
    // do something here
    break;
  }
}

void keyPressed() {
  switch(key) {
    
  case ' ': 
    showOutline = !showOutline; 
    break; 
    
  case '1':
    sym = 1;
    break;
    
  case '2':
    sym = 2;
    break;
    
  case '3':
    sym = 3;
    break;
    
  case 'r':
    tile = RECTILE;
    break;
    
  case 'f':
    tile = FTILE;
    break;
    
  case 'm':
    tile = MYTILE;
    break;
    
  }
}

