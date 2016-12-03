// Number of rectangles we want on each axis
final int num_divis = 200;
float sin_inc = TWO_PI/(float)num_divis;
// These are for the sin functions that determine each lines width and height
float pos_p = 0.0;
float pos_inc = 0.1;
// These are for the sin functions that determine the amplitude of the x sin
float amp_x = 0.0;
float amp_x_inc = 0.01;
// These are for the sin functions that determine the amplitude of the y sin
float amp_y = 0.0;
float amp_y_inc = 0.01;

void setup() {
  size(1400, 800);
  background(255);
  frameRate(30);
  colorMode(HSB, 255);
}


void draw() {
  // Clear the canvas
  background(255);

  // Max dimensions of a rectangles
  final float max_rect_h = height/(float)(num_divis);
  final float rect_width = width/(float)num_divis;
  
  // Now loop through and draw the rectangles
  for(int y = 0; y < num_divis; y++) {
    for(int x = 0; x < num_divis; x++) {
      fill(0);
      strokeCap(SQUARE);
      strokeWeight(rect_width);
      //stroke(255*sin(x/float(num_divis)*TWO_PI)+255*cos(y/float(num_divis)*TWO_PI), 255, 255);
      stroke(255*sin(pos_p+x*sin_inc+y*cos(x*sin_inc)), 255, 255);
      //line(x*rect_width, y*max_rect_h, x*rect_width, y*max_rect_h + max_rect_h*sin(a+x*sin_inc));
      //line(x*rect_width, y*max_rect_h, x*rect_width + rect_width*sin(amp_x+x*amp_x_inc)*sin(pos_p+x*sin_inc), y*max_rect_h + max_rect_h*cos(amp_y+x*amp_y_inc)*sin(pos_p+x*sin_inc));
      //line(x*rect_width, y*max_rect_h, x*rect_width, y*max_rect_h + max_rect_h*cos(amp_y+x*amp_y_inc)*sin(pos_p+x*sin_inc+y*sin(x*sin_inc)));
      line(x*rect_width, y*max_rect_h, x*rect_width, y*max_rect_h + max_rect_h*sin(pos_p+x*sin_inc+y*cos(x*sin_inc)));
    }
  }
  pos_p += pos_inc;
  amp_x += amp_x_inc;
  amp_y += amp_y_inc;

  
}
