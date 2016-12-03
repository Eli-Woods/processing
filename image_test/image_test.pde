// Number of elements in each row
int num_x, num_y;

// So we can setup stuff at the beginning based on
// svg size
PShape cir_tmplt;

// Holds the starting rotations of each element
float[][] rads;
float rot_rate = 0.01;

// For holding the shapes
ArrayList<PShape> cirs = new ArrayList<PShape>();

void setup() {
  // Window settup
  size(1400, 800);
  
  // Load up the shape
  cir_tmplt = (loadShape("get_rekt_audion.svg"));

  // Initialize global variables
  num_x = (int)(width/cir_tmplt.width) + 1;
  num_y = (int)(height/cir_tmplt.height) + 1;
  println(num_x);
  println(num_y);
  rads = new float[num_x][num_y];

  for(int x=0; x < num_x; x++) {
    for(int y=0; y < num_y; y++) {
      cirs.add(loadShape("get_rekt_audion.svg"));
      cirs.get(x*num_y+y).rotate(int(random(5))*TWO_PI/4.);
    }
  }
  printArray(rads);

}

void draw() {
  background(255); 
  for (int x = 0; x < num_x; x++) {
    for (int y = 0; y < num_y; y++) {
      PShape cir = cirs.get(x*num_y+y);
      //translate(cir.width*x-cir.width, cir.height*y-cir.height);
      translate(cir.width*x, cir.height*y);
      //cir.translate(-cir.width/2., -cir.height/2.);
      if((x*num_y+y)%2 == 0) {
        cir.rotate(rot_rate*TWO_PI);
      }
      else {
        cir.rotate(-rot_rate*TWO_PI);
      }
      shape(cir, 0, 0);
      resetMatrix();
    }
  }
}
