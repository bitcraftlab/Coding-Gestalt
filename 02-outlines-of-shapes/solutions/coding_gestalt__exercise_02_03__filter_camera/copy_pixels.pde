
// this is how to copy pixels using get and put
PImage copy_pixels_easy(PImage source) {
  
  Timer.start();
  
  // get image dimensions
  int w = source.width;
  int h = source.height;
  
  // create a target image
  PImage target = createImage(w, h, RGB);
  


  // let the pixel pushing begin!
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      
      // just copy the pixel from the source to the target
      // this is where you do all the crazy per pixel operations
      target.set(x, y, source.get(x, y));
      
    }
  }
  
  Timer.stop("copy pixels easy");

  return target;
  
}


// this is how to copy pixels using the pixels array
PImage copy_pixels_fast(PImage img) {
  
  Timer.start();
  
  // get image dimensions
  int w = img.width, h = img.height;
  
  // create a target image
  PImage img2 = createImage(w, h, RGB);
  
  // tell the source image you are about to read pixels
  img.loadPixels();
  
  // let the pixel pushing begin!
  for(int y = 0; y < h; y++) {
    for(int x = 0; x < w; x++) {
      
      // just copy the pixel from the source to the target
      // this is where you do all the crazy per pixel operations
      img2.pixels[y * w + x] = img.pixels[y * w + x];
      
    }
  }
  
  // tell the target image you are done writing pixels 
  img2.updatePixels();
  
  Timer.stop("copy pixels fast");
  
  return img2;
  
}

