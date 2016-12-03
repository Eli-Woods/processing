class Gauss {
  PShape g;
  float x, y;

  Gauss(float sigma, float _height, float _width) {
    float alpha = 1./sqrt(TWO_PI*sigma);
    g = createShape();
    g.beginShape(); 
    
    // Iterate over horizontal pixels
    for (x = 0; x <= _width; x+= 0.1) {
      // Calculate a y value according to noise, map to 
      y = _height-100*_height*alpha*exp(-1*pow(x-_width/2., 2)/(2.*sqrt(sigma))); // Option #1: 2D Noise
      
      // Set the vertex
      vertex(x, y); 
    }
    // increment y dimension for noise
    vertex(_width, _height);
    vertex(0, _height);
    endShape(CLOSE);
  }

  void display() {
    shape(g);
  }
}
