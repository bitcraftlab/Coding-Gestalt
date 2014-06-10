
// a single sensor measurement
class Sample {
 
  PVector p, v, a;
  int vv, aa; 
  
  // parse data
  Sample(int[] data) {
    
    int x = data[0], y = data[1], z = data[2];
    p = new PVector(x, y, z);
    
    vv = data[3];
    aa = data[4];
    
    int vx = data[5], vy = data[6], vz = data[7];
    v = new PVector(vx, vy, vz);
    
    int ax = data[8], ay = data[9], az = data[10];
    a = new PVector(ax, ay, az);
    
  }
  
  // return data as string
  String toString() {
    return "pos = " + p.toString()
      + "; " + "|v| = " + vv
      + "; " + " v = " + v.toString()
      + "; " + "|a| = " + aa
      + "; " + " a = " + a.toString()
      ;
  }
  
}
