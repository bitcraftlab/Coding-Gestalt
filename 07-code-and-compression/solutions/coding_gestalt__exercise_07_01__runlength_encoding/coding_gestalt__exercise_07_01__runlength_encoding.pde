
String[] imageNames = {"bunny-1", "bunny-2",  "turing", "genesis" };
PImage leftImage, centerImage, rightImage;
int w = 400, h = 400;
int n = w*h;
int pick = 0;
int b = 6;

void setup() {
  size(3*w+4*b, h+2*b);
  pickImage();
}

void draw() {
  background(0);
  image(leftImage, b, b, w, h);
  image(centerImage, w+2*b, b, w, h);
  image(rightImage, 2*w+3*b, b, w, h);
}

void keyPressed() {
  
  switch(key) {
    
    case ' ':  // pick rhe next image
      pick = (pick + 1) % 4;
      pickImage();
      break;
      
    case 's': // save image in .rle format
      String filename = "output/" + imageNames[pick] + ".rle";
      println("Saving " + filename);
      saveImage(leftImage, filename);
      break;
  }

}


void pickImage() {
  
  // load image and show it on the left side
  leftImage = loadImage(imageNames[pick] + ".png");
  
  // Show runlength encoded data as image in the center
  centerImage = bytesToImage(runlengthEncode(imageToBytes(leftImage)));
  
  // Runlength decode the data back again and show it on the right
  rightImage = bytesToImage(runlengthDecode(imageToBytes(centerImage)));
  
}



