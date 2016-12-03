PShape gauss;

void setup() {
  size(640, 360);
  gauss = createShape();
  gauss.beginShape();
  gauss.fill(255);
  float sigma = 20*width;
  float alpha = 1./sqrt(TWO_PI*sigma);

  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x+= 0.1) {
    // Calculate a y value according to noise, map to 
    float y = height-100*height*alpha*exp(-1*pow(x-width/2., 2)/(2.*sqrt(sigma))); // Option #1: 2D Noise
    
    // Set the vertex
    vertex(x, y); 
  }
  // increment y dimension for noise
  vertex(width, height);
  vertex(0, height);
  gauss.endShape(CLOSE);
}

void draw() {
  background(51);
  
  // How to draw the gauss within draw()
  //fill(255);
  //beginShape();
  //float sigma = 20*width;
  //float alpha = 1./sqrt(TWO_PI*sigma);

  //// Iterate over horizontal pixels
  //for (float x = 0; x <= width; x+= 0.1) {
  //  // Calculate a y value according to noise, map to 
  //  float y = height-100*height*alpha*exp(-1*pow(x-width/2., 2)/(2.*sqrt(sigma))); // Option #1: 2D Noise
    
  //  // Set the vertex
  //  vertex(x, y); 
  //}
  //// increment y dimension for noise
  //vertex(width, height);
  //vertex(0, height);
  //endShape(CLOSE);
  
  // An attempt to draw it as a PShape
  shape(gauss);
}