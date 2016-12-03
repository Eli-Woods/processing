import processing.opengl.*;

int X_AXIS = 1;
int Y_AXIS = 2;
float yoff = 0.0;        // 2nd dimension of perlin noise
float x_inc = 1;
color c1, c2;
float c_inc = .1;
float hh = 0;

void setup() {
  size(800, 450, OPENGL);
  colorMode(HSB, 255);
  c1 = color(hh, 255, 255);
  c2 = color(hh+128, 255, 255);
}

void draw() {
  // First update the colors for the gradient
  SetGradient(0, 0, width, height, c1, c2, X_AXIS);
  hh += c_inc;
  c1 = color(hh, 255, 255);
  c2 = color(hh+128, 255, 255);
  
  fill(255);
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float yy = 0; yy <= 10; yy++) {
    if(yy%2 == 0) {
      for (float x = 0; x <= width; x += x_inc) {
        // Calculate a y value according to noise, map to 
        //float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
        float y = map(noise(xoff, yoff), 0, 1, yy/10.*width,yy/10.*height);    // Option #2: 1D Noise

        // Set the vertex
        vertex(x, y); 
        // Increment x dimension for noise
        xoff += 0.05;
      }
    }
    else {
      for (float x = width; x >= 0; x -= x_inc) {
        // Calculate a y value according to noise, map to 
        //float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
        float y = map(noise(xoff, yoff), 0, 1, yy/10.*width,yy/10.*height);    // Option #2: 1D Noise

        // Set the vertex
        vertex(x, y); 
        // Increment x dimension for noise
        xoff += 0.05;
      }
    }
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void SetGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
