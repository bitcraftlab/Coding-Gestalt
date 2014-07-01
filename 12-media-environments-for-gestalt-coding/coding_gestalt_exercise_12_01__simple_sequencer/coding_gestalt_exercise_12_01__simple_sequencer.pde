

int rows = 4;
int cols = 6;
float dx, dy;

Sequencer sequencer = new Sequencer();


void setup() {
  
  size(600, 400);
    
  dx = width / cols;
  dy = height / rows;
  
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      sequencer.addRectangle(x, y);
    }
  }
  
}


void draw() {
  sequencer.draw();
}


void mouseClicked() {
  sequencer.mouseClicked();
}



