// Rotation rate
float rot_rate = 0.001;

// List to hold n shapes
ArrayList<PShape> lst = new ArrayList<PShape>();

void setup() {
  size(600, 600);

  // Initialize ArrayList of PShapes
  for(int x= 0; x < 2; x++) {
    lst.add(createShape(RECT,0, 0, 30, 30));
  }
}

void draw() {
  background(255);

  // Just attempt to draw the shapes in place first
  for(int x = 0; x < 2; x++) {
    PShape shp = lst.get(x);
    translate(30*x, 30*x);
    shp.rotate(rot_rate*TWO_PI);
    shp.translate(-(x+1)*shp.height/2., -(x+1)*shp.height/2.);
    shp.setFill(0);
    shape(shp, 0, 0);
    resetMatrix();
  }
}
