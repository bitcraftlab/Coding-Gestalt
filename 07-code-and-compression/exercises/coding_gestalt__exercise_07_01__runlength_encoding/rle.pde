

// Implement the runlength encoder here
int[] runlengthEncode(int[] input) {
    int[] output = input;
    return output;
}

// Implement the runlength decoder here
int[] runLenthDecode(int[] input) {
  int[] output = input;
  return output;
}

// If an image ends in .rle, pass it to the RLE decoder 
// Assume images are always 400x400 pixels and 256 levels of gray
PImage loadImage(String filename) {
  println("Loading image " + filename);
  PImage img = super.loadImage(filename);
  return img;
}


// If an image ends in .rle, pass it to the RLE decoder 
// Assume images are always 400x400 pixels and 256 levels of gray
void saveImage(PImage img, String filename) { 
  println("Saving image " + filename );
  //img.save(filename);
}

