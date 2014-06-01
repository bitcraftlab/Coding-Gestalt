
// runlength encode of a sequence of bytes
// (hopefully decreasing the number of bytes)
byte[] runlengthEncode(byte[] input) {

  int j = 0;                                          // output index
  byte repeat = 1;                                    // repetition counter
  byte prevByte = 0;  
  byte[] output = new byte[2*n];                      // maximum size, just in case.

  for (int i = 0; i < input.length; i++) {
    byte theByte = input[i];                          // get a byte from the input
    if (prevByte == theByte && (int(repeat) < 255)) { // does the same byte occur again?
      repeat++;                                       // yes ==> let's increase the counter
    } else {                                          // no  ==> encode the previous run
      output[j] = prevByte;                           // value byte
      output[j+1] = repeat;                           // frequency byte
      repeat = 1;                                     // reset counter 
      j += 2;                                         // increase index
    }
    prevByte = theByte;
  }
  
  return subset(output, 0, j);
}


// runlength decode a sequence of bytes 
// (resulting in 200x200 bytes)
byte[] runlengthDecode(byte[] input) {  

  int j = 0;
  byte[] output = new byte[n];
  
  for (int i = 0; i < input.length; i+=2) {
    byte theByte = input[i];
    int repeat = int(input[i+1]);
    for (int k = 0; k < repeat; k++) {
      output[j + k] = theByte;
    }
    j += repeat;
  }
  
  return output;
}


// If an image ends in .rle, pass it to the RLE decoder 
// Assume images are always 400x400 pixels and 256 levels of gray
PImage loadImage(String filename) {
  if (filename.endsWith(".rle")) {
    byte[] bytes = loadBytes(filename);
    return bytesToImage(runlengthDecode(bytes));
  } else {
    return super.loadImage(filename);
  }
}


// If an image ends in .rle, pass it to the RLE decoder 
// Assume images are always 400x400 pixels and 256 levels of gray
void saveImage(PImage img, String filename) {  
  if (filename.endsWith(".rle")) {
    byte[] bytes = imageToBytes(img);
    saveBytes(filename, runlengthEncode(bytes));
  } else {
    img.save(filename);
  }
}


// create grayscale values from image
byte[] imageToBytes(PImage img) {
  
  byte[] bytes = new byte[n];
  img.loadPixels();
  
  for (int i = 0; i < n; i++) {
    bytes[i] = byte(brightness(img.pixels[i]));
  }
  
  return bytes;
  
}


// create image from grayscale values
PImage bytesToImage(byte[] bytes) {
  
  PImage img = createImage(400, 400, RGB);
  img.loadPixels();
  
  for (int i = 0; i < bytes.length; i++) {
    img.pixels[i] = color(int(bytes[i]));
  }
  
  img.updatePixels();
  return img;
  
}

