
class Rectangle {

  int x, y;
  color c;

  Rectangle(int x, int y) {
    this.x = x;
    this.y = y;
    c = color(random(255), random(255), random(255));
  }

  void draw() {
    fill(c);
    rect(x * dx, y * dy, dx, dy);
  }
  
  boolean inside(int checkx, int checky) {
    boolean insidex = (checkx > x * dx) && (checkx < (x + 1) * dx);
    boolean insidey = (checky > y * dy) && (checky < (y + 1) * dy);
    return (insidex && insidey);
  }
  
  void mouseClicked() {
    c = color(0); 
  }
  
}

