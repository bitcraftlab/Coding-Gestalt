

SpaceFillingCurve fractal;
int block = 0;
PImage img;
int n;

void setup() {
  
  size(512, 512);
  int w = max(width, height);
  fractal = new FractalTable(new Hilbert(w));  
  img = loadImage("monalisa.jpg");
  img.resize(w, w);
  n = w*w;
  
}

void draw() {
  background(255);
  int shift = 1<<block;
  
  for(int i=0; i<n; i++) {
      Vector v1 = fractal.d2vec(i);
      Vector v2 = fractal.d2vec( (i+ frameCount * shift ) % n );
      color c = img.get(v1.x, v1.y);
      set(v2.x, v2.y, c);
  }

}

void keyPressed() {
  if(key == '+') block++;
  if(key == '-') block--;
  block = constrain(block, 0, 17);
}



