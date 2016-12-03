float x1, x2, x3, y1, y2, y3, x4, y4;
float x_offset = 20;
float y_offset = 40;
float spiral_density = 0.05;
float spiral_dens_delta = 0.02;
int max_triangles = 60;
int num_triangles = 0;
ArrayList<PShape> tris;
float s_x1, s_y1, s_x2, s_y2, s_x3, s_y3;
boolean forward = true;
boolean dens_forward = true;
int strWeight = 4;

void setup() {
  size(800, 800);
  background(0);

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
  strokeWeight(strWeight);
  triangle(x1, y1, x2, y2, x3, y3);
  tris = new ArrayList();
}

void draw() {
  if(tris.size() == max_triangles) {
    forward = false;
  }
  if(tris.size() == 0) {
    forward = true;
    x1 = x_offset;
    y1 = y_offset;
    x2 = width-x_offset;
    y2 = y_offset;
    x3 = x_offset+(width-x_offset)/2.;
    y3 = y_offset+(width-x_offset)/2.*sqrt(3);
    strokeWeight(strWeight);
    triangle(x1, y1, x2, y2, x3, y3);
    if(spiral_density > 1/3.) {
      dens_forward = false;
    }
    else if (spiral_density < 0.05) {
      dens_forward = true;
    }
    if(dens_forward) {
    spiral_density += spiral_dens_delta;
    }
    else {
      spiral_density -= spiral_dens_delta;
    }
  }

  // If the triangles are growing inwards
  if(forward) {
    // Now loop over the number of triangles, and for each one
    // interpolate a point a fraction the way down and redraw a
    // triangle at that point
    x4 = x2*spiral_density+(1-spiral_density)*x3;
    y4 = y2*spiral_density+(1-spiral_density)*y3;
    x3 = x2; y3 = y2;
    x2 = x1; y2 = y1;
    x1 = x4; y1 = y4;

    strokeWeight(strWeight);
    strokeJoin(BEVEL);
    PShape tri = createShape(TRIANGLE, x1, y1, x2, y2, x3, y3);
    shape(tri);
    tris.add(tri);
  }

  // If we've reached the max limit of triangles, remove the them one
  // at a time and redraw everything. It's clunky but idk how else ya
  // expect me to do it!
  if(!forward) {
    background(0);
    tris.remove(tris.size() - 1);
    strokeWeight(strWeight);
    triangle(s_x1, s_y1, s_x2, s_y2, s_x3, s_y3);
    PShape tri;
    for(int i = 0; i < tris.size(); i++) {
      tri = tris.get(i);
      shape(tri);
    }
  }
}

