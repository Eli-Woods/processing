static final int ribbon_length = 255, H = 200;
 
void setup() {
  size(255, 200);
}
 
void draw() {
 
  float p = 0.5; 
  int up_y = 10; 
  int widthh = 1;  
  int height = 180;
  float a = pow (ribbon_length, 1-p);
  float colour = 0;
 
  for (int step = 0; step <= 255; step++) {
      colour = a * pow (step, p);
      fill(colour);
      rect(widthh*step, up_y, widthh, height);
      noStroke();
      //save("cross20.png");
   }
}
//int X_AXIS = 1;
//int Y_AXIS = 2;
//color c1, c2;
//float hue_inc = 2;
//float gHue = 0;
//
//void setup() {
//  size(800, 450);
//  colorMode(HSB, 255);
//  c1 = color(gHue, 255, 255);
//  c2 = color((gHue+64)%255, 255, 255);
//}
//
//void draw() {
//  // Draw the damn gradient
//  SetGradient(0, 0, width, height, c1, c2, X_AXIS); 
//  
//  // Update the colors
//  gHue = (gHue+hue_inc)%255;
//  if(gHue+64 > 255) {
//    c1 = color((gHue+64)%255, 255, 255);
//    c2 = color(gHue, 255, 255);
//  }
//  else {
//    c1 = color(gHue, 255, 255);
//    c2 = color((gHue+64)%255, 255, 255);
//  }
//}
//
//void SetGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
//
//  noFill();
//
//  if (axis == Y_AXIS) {  // Top to bottom gradient
//    for (int i = y; i <= y+h; i++) {
//      float inter = map(i, y, y+h, 0, 1);
//      color c = lerpColor(c1, c2, inter);
//      stroke(c);
//      line(x, i, x+w, i);
//    }
//  }  
//  else if (axis == X_AXIS) {  // Left to right gradient
//    for (int i = x; i <= x+w; i++) {
//      float inter = map(i, x, x+w, 0, 1);
//      color c = lerpColor(c1, c2, inter);
//      stroke(c);
//      line(i, y, i, y+h);
//    }
//  }
//}
