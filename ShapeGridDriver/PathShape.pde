/*===========================
  PathShape

  Class to represent a shape made up of a collection of vertices.

  This is the same class we have been working on with the following additions:

  Instance Variables:

  Point corner:
    Represents the upper-left corner of the region the
    vertices of the shape should be within.

    int shapeWidth, int shapeHeight
      The size of the region that the shape should be contained within.

  Methods to work on:
    0. isValidShape
  =========================*/


class PathShape {

  Point[] vertices; //vertext coordinates
  int numPoints; //number of points for a "complete" shape
  int setPoints; //current number of points added to vertices

  color inside;
  color border;

  Point centroid;
  float area;

  Point corner;
  int shapeWidth;
  int shapeHeight;

  /*===========================
    np Constructor

    Initializes the instance vairables.

    You do not need to modify this method.
    =========================*/
  PathShape(int np) {
    numPoints = np;
    setPoints = 0;
    vertices = new Point[numPoints];
    inside = 255;
    border = 0;
    centroid = new Point(0, 0);
    area = 0;
    corner = new Point(0, 0);
    int shapeWidth = width;
    int shapeHeight = height;
  }//default contructor

  /*===========================
    polygon Constructor

    Initializes the instance vairables.
    Calls makeRandomClosedPolygon()

    You do not need to modify this method.
    =========================*/
  PathShape(int np, Point center, int minRadius, int maxRadius) {
    this(np);
    corner.x = center.x - maxRadius;
    corner.y = center.y - maxRadius;
    shapeWidth = maxRadius * 2;
    shapeHeight = maxRadius * 2;
    makeRandomClosedPolygon(center, minRadius, maxRadius);
  }//random closed polygon constructor

  /*===========================
    random vertex Constructor

    Initializes the instance vairables.
    Calls makeRandomVertices()

    You do not need to modify this method.
    =========================*/
  PathShape (int np, int minX, int minY, int maxX, int maxY) {
    this(np);
    corner.x = minX;
    corner.y = minY;
    shapeWidth = maxX - minX;
    shapeHeight = maxY - minY;
    makeRandomVertices(minX, minY, maxX, maxY);
  }//random constructor


  /*===========================
    isValidShape()

    Returns true if the centroid is within the shapeWidth x shapeHeight
    rectangle with an upper-left corner at corner.
    =========================*/
  boolean isValidShape() {
    return false;
  }



  /*===========================
    addPoint()

    You do not need to modify this method.
    =========================*/
  void addPoint(int x, int y) {
    if (setPoints < numPoints) {
      vertices[setPoints] = new Point(x, y);
      setPoints++;
    }//add point if there's room
  }//addPoint

  /*===========================
    addPoint()

    You do not need to modify this method.
    =========================*/
  void addPoint(Point p) {
    if (setPoints < numPoints) {
      vertices[setPoints] = p;
      setPoints++;
    }//add point if there's room
    setArea();
    setCentroid();
  }//addPoint

  /*===========================
    display

    You do not need to modify this method.
    =========================*/
  void display() {
    fill(inside);
    stroke(border);
    beginShape();
    for (int p=0; p < setPoints; p++) {
      vertex(vertices[p].x, vertices[p].y);
    }//loop over vertices
    endShape(CLOSE);
    noStroke();
    fill(255, 255, 0);
    circle(centroid.x, centroid.y, 5);
  }//display

  /*===========================
    makeRandomVertices()

    You do not need to modify this method.
    =========================*/
  void makeRandomVertices(int minX, int minY, int maxX, int maxY) {
    for(int p=0; p < numPoints; p++) {
      addPoint(new Point(minX, minY, maxX, maxY));
    }//generate points loop
    setArea();
    setCentroid();
  }//makeRandomVertices

  /*===========================
    makeRandomClosedPolygon

    You do not need to modify this method.
    =========================*/
  void makeRandomClosedPolygon(Point center, int minRadius, int maxRadius) {
    for(int p=0; p < numPoints; p++) {
      float theta = radians((float(p)/numPoints) * 360);
      int r = int(random(minRadius, maxRadius));
      int x = int(r * cos(theta)) + center.x;
      int y = int(r * sin(theta)) +  center.y;
      addPoint(x, y);
    }//generate points loop
    setArea();
    //shapes made this way already have a defined center
    centroid = center;
  }//makeRandomClosedPolygon

  /*===========================
    setArea

    You do not need to modify this method.
    =========================*/
  void setArea() {
    area = 0;
    for (int i=0; i < setPoints; i++) {
      Point p0 = vertices[i];
      Point p1;
      //use point 0 if at the end of the list.
      if (i == setPoints - 1) {
        p1 = vertices[0];
      }
      else {
        p1 = vertices[i+1];
      }
      area+= (p0.x * p1.y) - (p1.x * p0.y);
    }//loop over points
    area = area / 2;
  }//setArea

  /*===========================
    setCentroid*()

    You do not need to modify this method.
    =========================*/
  void setCentroid() {
    int sumX = 0;
    int sumY = 0;
    for (int i=0; i < setPoints; i++) {
      Point p0 = vertices[i];
      Point p1;
      //use point 0 if at the end of the list.
      if (i == setPoints - 1) {
        p1 = vertices[0];
      }
      else {
        p1 = vertices[i+1];
      }
      sumX += (p0.x + p1.x) * ((p0.x * p1.y) - (p1.x * p0.y));
      sumY += (p0.y + p1.y) * ((p0.x * p1.y) - (p1.x * p0.y));
    }

    centroid.x = int(sumX / (6*area));
    centroid.y = int(sumY / (6*area));
  }//setCentroid

}//PathShape
