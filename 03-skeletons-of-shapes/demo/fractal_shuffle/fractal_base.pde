
// base class for spacefilling curves
abstract class SpaceFillingCurve {
  int w, h;
  abstract int vec2d(Vector v);
  abstract Vector d2vec(int d);
}


// integer vector structure
class Vector {
  int x, y;
}


