
////////////////////////////
///        cf2p5         /// 
////////////////////////////
 
// ContextFree to Processing
// (c) Martin Schneider 2014

/// helper functions ///

float h, s, b, a;
float th, ts, tb, ta;

void push()   { pushMatrix(); pushStyle(); i++; }
void pop()    { popMatrix(); popStyle(); i--; }

int select(float s1, float s2) { return select(new float[] {s1, s2});}
int select(float s1, float s2, float s3) { return select(new float[] {s1, s2, s3});}
int select(float s1, float s2, float s3, float s4) { return select(new float[] {s1, s2, s3, s4});}
int select( float[] s) { 
  float sum=0; for(int i=0; i< s.length; i++) sum += s[i];
  float sel = random(sum);
  sum=0; for(int i=0; i< s.length; i++) if((sum += s[i]) >= sel) return i+1;
  return i;
}
  
void h(float _h) { fill(radians(h=_h), s, b, a); }
void sat(float _s) { fill(radians(h), s=_s, b, a); }
void b(float _b) { fill(radians(h), s, b=_b, a); }
void a(float _a) { fill(radians(h), s, b, a=_a); }
void ht(float _h) { fill(radians(h=lerp(h, th, _h)), s, b, a); }
void st(float _s) { fill(radians(h), s=lerp(s, ts, _s), b, a); }
void bt(float _b) { fill(radians(h), s, b=lerp(b, tb, _b), a); }
void at(float _a) { fill(radians(h), s, b, a=lerp(a, ta, _a)); }
void th(float _th) { th=_th; }
void ts(float _ts) { ts=_ts; }
void tb(float _tb) { tb=_tb; }
void ta(float _ta) { ta=_ta; }
void s(float x) { scale(x); }
void s(float x, float y) { scale(x,y); }
void s(float x, float y, float z) { scale(x,y,z); }
void r(float r) { rotate(radians(r)); }
void x(float x) { translate(x,0); }
void y(float y) { translate(0,y); }
void z(float z) { translate(0,0,z); }

void CIRCLE() { ellipse(0,0,1,1); }
void SQUARE() { rect(-.5,-.5,1,1); }
void TRIANGLE() {quad(-.5, .28868, 0, -.57735, .5, .28868, -.5, .28868);}


