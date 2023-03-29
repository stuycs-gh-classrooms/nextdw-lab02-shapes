/*===========================
  When run, this program will display a 4x4 grid
  of different PathShape objects.

  Hitting the spacebar will generate a new set of
  PathShape Objects.

  You do not need to modify this driver file at all.
  =========================*/

int PATH = 0;
int TRIANGLE = 1;
int POLYGON = 2;
int REGULAR = 3;
int POPULATION_SIZE = 16;
int MAX_SIZE = 100;
int MAX_POINTS = 12;

ShapeGrid g;


void setup() {
  size(500, 500);
  g = new ShapeGrid(5, 5, MAX_SIZE, MAX_POINTS);
  g.display();
}//setup

void draw() {
  background(0);
  g.display();
}//draw

void keyPressed() {
  if (key == ' ') {
    g.makeShapes();
  }
}//keyPressed
