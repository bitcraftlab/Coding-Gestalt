
String[] imageNames = {"bunny-1", "bunny-2",  "turing", "genesis" };

PImage leftImage, centerImage, rightImage;

int w = 400, h = 400;
int n = w*h;
int pick = 0;
int b = 6;

void setup() {
  size(3*w+4*b, h+2*b);
  update();
}


void draw() {
  
  // draw all three images + spacing
  background(0);
  image(leftImage, b, b, w, h);
  image(centerImage, w+2*b, b, w, h);
  image(rightImage, 2*w+3*b, b, w, h);
  
}


void keyPressed() {
  
  switch(key) {
    
    case ' ':  // pick rhe next image
      pick = (pick + 1) % 4;
      update();
      break;
      
    case '0': // reset to original
      update();
      break;
      
    case 's': // save glitched image as png
      String filename = "output/" + imageNames[pick] + "-glitched.png";
      println("Saving " + filename);
      saveImage(rightImage, filename);
      break;      
  }
  
  // use numeric keys to glitch
  if(key >= '1' && key <= '9') {
     centerImage = glitchImage(centerImage, key - '0');
     updateOutput();
  }

}


void update() {
   updateInput();
   updateOutput(); 
}


void updateInput() {
  
  // load image and show it on the left side
  leftImage = loadImage(imageNames[pick] + ".png");
   
  // Show runlength encoded data as image in the center
  centerImage = bytesToImage(runlengthEncode(imageToBytes(leftImage)));
  
}


void updateOutput() {
  
  // Runlength decode the data back again and show it on the right
  rightImage = bytesToImage(runlengthDecode(imageToBytes(centerImage)));
  
}



