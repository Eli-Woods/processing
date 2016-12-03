import processing.svg.*;
float x1, x2, x3, y1, y2, y3, x4, y4;
float x_offset = 20;
float y_offset = 40;
float spiral_density = .15;
int max_triangles = 100;
float s_x1, s_y1, s_x2, s_y2, s_x3, s_y3;
boolean record = false;
String filename;

void setup() {
  size(800, 800);
  background(51);

  // First create the polygon from the points and draw it
  s_x1 = x_offset;
  s_y1 = y_offset;
  s_x2 = width-x_offset;
  s_y2 = y_offset;
  s_x3 = x_offset+(width-x_offset)/2.;
  s_y3 = y_offset+(width-x_offset)/2.*sqrt(3);
  x1 = s_x1;
  y1 = s_y1;
  x2 = s_x2;
  y2 = s_y2;
  x3 = s_x3;
  y3 = s_y3;
  noLoop();
}

void draw() {

  for(int j = 1; j < 10; j++) {
    filename = "spi-tri-"+Integer.toString(j)+".svg";
    beginRecord(SVG, filename);
    strokeWeight(5);
    //strokeJoin(BEVEL);
    triangle(x1, y1, x2, y2, x3, y3);
    for(int i = 0; i < max_triangles/j; i++) {
      x4 = x2*spiral_density+(1-spiral_density)*x3;
      y4 = y2*spiral_density+(1-spiral_density)*y3;
      x3 = x2; y3 = y2;
      x2 = x1; y2 = y1;
      x1 = x4; y1 = y4;
      strokeWeight(5);
      strokeJoin(BEVEL);
      triangle(x1, y1, x2, y2, x3, y3);
    }
    endRecord();
    x1 = s_x1;
    y1 = s_y1;
    x2 = s_x2;
    y2 = s_y2;
    x3 = s_x3;
    y3 = s_y3;
  }

}

