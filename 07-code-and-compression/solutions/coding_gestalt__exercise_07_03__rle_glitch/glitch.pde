

PImage glitchImage(PImage img, int op) {
  
  byte[] bytes = imageToBytes(img);
  print("Glitch [" + key + "]: ");
  
  switch(op) {
    
    case 1:
      println("mutate 1");
      mutate(bytes, 0.002, 255);
      break;
      
    case 2:
      println("mutate 2");
      mutate(bytes, 0.02, 16);
      break;
      
    case 3:
      println("delete 1");
      delete(bytes, 0.001, 1);
      break;
      
    case 4:
      println("delete 2");
      delete(bytes, 0.001, 2);
      break;
  
  }
  
  return bytesToImage(bytes);
  
}

// change values of the bytes by a certain amount (limited by range)
void mutate(byte[] bytes, float rate, int range) {
  for (int i = 0; i < bytes.length; i++) {
    if (random(1) <= rate) {
      bytes[i] = (byte) (constrain(int(bytes[i]) + round(random(- range, +range)), 0, 255));
    }
  }
}

// cut out sequences of bytes
void delete(byte[] bytes, float rate, int len) {
  int in = 0;
  int n  = bytes.length;
  println(n);
  for(int out = 0; in < n; out++, in++) {
    if(random(1) < rate) { 
      in = constrain(in + len, 0, n-1);
      if(in >= n -1) return;
    }
    bytes[out] = bytes[in];
  }
}

// insert sequences of bytes (limited by range)
void insert(byte[] bytes, float rate, int range) {
   
}
