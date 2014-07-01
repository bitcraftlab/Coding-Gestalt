

int rows = 8;
int cols = 12;
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
  
  setupOSC();
  
}


void draw() {
  if(frameCount % 15 == 0) sequencer.step();
  sequencer.draw();
}


void mouseClicked() {
  sequencer.mouseClicked();
}



