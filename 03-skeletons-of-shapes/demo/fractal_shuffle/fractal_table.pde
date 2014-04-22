
// look-up table wrapper for spacefilling curves

class FractalTable extends SpaceFillingCurve {
  
  Vector[] tvec;
  int[][] td;
  
  FractalTable(SpaceFillingCurve c) {
    
    w = c.w;
    h = c.h;
    
    tvec = new Vector[w*h];
    td = new int[w][h];
    
    for(int i=0; i<w*h; i++) {
      Vector vec = c.d2vec(i);
      tvec[i] = vec;
      td[vec.x][vec.y] = i;
    }
    
  }
  
  int vec2d(Vector vec) {
    return td[vec.x][vec.y];
  }
  
  Vector d2vec(int d) {
    return tvec[d]; 
  }
    
}
  
