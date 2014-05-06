

void setup() {
  size(600, 600);
  stroke(200);
}


void draw() {
 
  background(0);
  randomSeed(0);
  
  int boxsize = (mouseX % 40) + 10;
  int ymax = width / boxsize;
  int xmax = height / boxsize;
  noStroke();
  
  for(int y = 0; y < ymax; y++) {
    for(int x = 0; x < xmax; x++) {
      pushMatrix();
      translate(x * boxsize, y * boxsize);
      element(boxsize, random(1));
      popMatrix();
    } 
  } 
}


void element(int boxsize, float val) {
   if(val > 0.5) {
     triangle(0, 0, 0, boxsize, boxsize, boxsize);
   } else {
     triangle(0, boxsize, boxsize, 0, boxsize, boxsize);
   }
}

