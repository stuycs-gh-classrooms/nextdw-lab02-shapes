/*===========================
  ShapeGrid

  Stores a 2D array of PathShape Objects.

  Each individual PathShape can be a PathShape or
  an object that is a subclass of PathShape.

  Each PathShape should fit in a square region.

  Methods to work on:
    0. void makeShapes()
  =========================*/

class ShapeGrid {

  PathShape[][] grid; //the grid of PathShapes
  int shapeSize; //max size of each shape
  int maxPoints; //max points for each shape


  /*===========================
    Constructor

    Initializes the instance vairables, calls makeShapes()

    You do not need to modify this method.
    =========================*/
  ShapeGrid(int numRows, int numCols, int s, int mp) {
    grid = new PathShape[numRows][numCols];
    maxPoints = mp;
    shapeSize = s;
    makeShapes();
  }//constructor

  /*===========================
    makeShapes()

    Creates a new shape for each element in grid.

    The type of shape should be randomly chosen.

    All shapes should fit within a shapeSize x shapeSize square,
    where the x and y values provided below represent the uper-left
    corner.

    If the shape is a Polygon or RegularGon, the center should be
    the center of the current section of the screen being populated.

    If the shape is not a Triangle, the number of points should
    be a random number in the range [3, maxPoints).

    If the shape is a Polygon, the range of radii should be
    [10, shapeSize/2),

    If the shape is a RegularGon, the radius should be a random
    number in the range [10, shapeSize/2)

    If the value of isValidShape() is true, set the insdie color
    to green.
    If the value of isValidShape() is false, set the insdie color
    to red.
    =========================*/
  void makeShapes() {
    int x = 0;
    int y = 0;
    for (int r=0; r < grid.length; r++) {
      for (int c=0; c < grid[r].length; c++) {
        int type = int(random(4)); //select a random shape type, use the constants from ShapeDriver
        grid[r][c] = new PathShape(1);
        x+= shapeSize;
      }//cols
      y+= shapeSize;
      x = 0;
    }//rows
  }//makePathShapes


  void display() {
    for (int r=0; r < grid.length; r++) {
      for (int c=0; c < grid[r].length; c++) {
        grid[r][c].display();
      }
    }
  }//display

}//ShapeGrid
