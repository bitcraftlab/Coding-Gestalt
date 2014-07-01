

int rows = 4;
int cols = 6;

ArrayList<Rectangle> rectangles = new ArrayList();

float dx, dy;


void setup() {
  
  size(600, 400);
    
  dx = width / cols;
  dy = height / rows;

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      rectangles.add(new Rectangle(x, y));
    }
  }
  
}


void draw() {
  for(Rectangle r : rectangles) {
    r.draw(); 
  }
}


void mouseClicked() {
  for(Rectangle r : rectangles) {
    if(r.inside(mouseX, mouseY)) {
      r.mouseClicked();
    } 
  }
}



