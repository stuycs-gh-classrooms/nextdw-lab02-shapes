/*===========================
  Triangle


  Methods to override
    0. setCentroid
      The coordinates of the centroid of a triangle can be found
      by taking the average of the coordinates of its vertices.

      Write a overriding setCentroid that used this method to
      find the Triangle's centroid.

    1. isValidShape
      A valid Triangle is one with an area greater than 10
  =========================*/

class Triangle extends PathShape {

  Triangle() {
    super(3);
  }//default constructor

  Triangle(Point center, int minRadius, int maxRadius) {
    super(3, center, minRadius, maxRadius);
  }//random constructor

  Triangle(int minX, int minY, int maxX, int maxY) {
    super(3, minX, minY, maxX, maxY);
  }//other random constructor


}//Triangle
