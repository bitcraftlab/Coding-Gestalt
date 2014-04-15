// a simple static filter class for in-place image manipulation.
// Use this to get rid of some of the boilerplate code needed for pixel pushing

import processing.core.PImage;

class Filter {
  
  static int[] source;
  static int[] target;
  static PImage image;
  
  // create target and load all pixels
  static void begin(PImage img) {
    image = img;
    image.loadPixels();
    source = image.pixels;
    target = new int[source.length];
  }
  
  static PImage end() {
    image.pixels = target;
    image.updatePixels(); 
    return image;
  }
  
}
