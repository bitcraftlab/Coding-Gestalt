
// Mapping from hilbert curve to 2D space and back
// http://en.wikipedia.org/wiki/Hilbert_curve

class Hilbert extends SpaceFillingCurve {
  
  int n; // diameter of the hilbert curve
  
  Hilbert(int _n) {
    n = _n;
    w = h = n;
  }
  
  int vec2d(Vector vec) {
    Vector v = new Vector();
    v.x = vec.x;
    v.y = vec.y;
    int rx, ry, s, d=0;
    for(s = n/2; s>0; s/=2) {
      rx = (v.x & s) > 0 ? 1 : 0;
      ry = (v.y & s) > 0 ? 1 : 0;
      d += s * s * ((3 * rx) ^ ry);
      rot(s, v, rx, ry);
    }
    return d;
  }
  
  Vector d2vec(int d) {
    int rx, ry, s, t =d;
    Vector v = new Vector();
    for(s=1; s<n; s*=2) {
      rx = 1 & (t/2);
      ry = 1 & (t^rx);
      rot(s, v, rx, ry);
      v.x += s * rx;
      v.y += s * ry;
      t /= 4;
    }
    return v;
  }
      
  void rot(int n, Vector v, int rx, int ry) {
    if (ry == 0) {
      if(rx == 1) {
        v.x = n-1 - v.x;
        v.y = n-1 - v.y;
      }
      // Swap x and y
      int t = v.x;
      v.x = v.y;
      v.y = t;
    }
  }
  
}

