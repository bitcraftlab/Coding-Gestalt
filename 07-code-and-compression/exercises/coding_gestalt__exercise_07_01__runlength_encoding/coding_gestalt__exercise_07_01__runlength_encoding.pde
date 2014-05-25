

String[] png_files = {
  "bunny-1.png",
  "bunny-2.png",  
  "turing.png", 
  "genesis.png"
};

String[] rle_files = {
  "bunny-1.rle", 
  "bunny-2.rle", 
  "turing.rle", 
  "genesis.rle"
};

int pick = 0;
PImage leftImage, rightImage;
int w = 400, h = 400;
int b = 6;

void setup() {
  size(2*w+3*b, h+2*b);
  pickImage();
}

void draw() {
  background(0);
  image(leftImage, b, b, w, h);
  image(rightImage, w+2*b, b, w, h);
}

void keyPressed() {
  pick = (pick + 1) % 4;
  pickImage();
}

void pickImage() {
  
  // pick image and show it on the left side
  leftImage = loadImage(png_files[pick]);
  
  // save it as run-length-encoded image
  // saveImage(leftImage, rle_files[pick]);
  
  // load the RLE image into the right side
  // rightImage = loadImage(rle_files[pick]);
    
  // Still cheating ...
  rightImage = loadImage(png_files[pick]);
  
}





