/*===========================
  class Polygon

  You do not need to modify this class.
  =========================*/

class RegularGon extends Polygon {
  int radius;

  RegularGon(int np, Point c, int r) {
    super(np, c, r, r);
    radius = r;
  }//constructor

}//RegularGon
