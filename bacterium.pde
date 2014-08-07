class Bactery {
  int x;
  int y;
  float angle;
  
  Bactery() {
    x = int(random(width));
    y = int(random(height));
    angle = 2*PI*random(1);
  }
  
  Bactery(int x, int y) {
    this.x = x;
    this.y = y;
    angle = 0;
  }
  
  void display() {
    stroke(0);
    fill(0);
    
    if(random(1) < 0.2)
      angle = 2*PI*random(1);
      
    int x1 = bactWidth;
    int y1 = 0;
    
    int x2 = bactWidth;
    int y2 = bactHeight;
    
    int x3 = 0;
    int y3 = bactHeight;
    
    // Apply the rotation
    int nx1 = int( x1*cos(angle) - y1*sin(angle) +x);
    int ny1 = int( x1*sin(angle) + y1*cos(angle) +y);
    
    int nx2 = int( x2*cos(angle) - y2*sin(angle) +x);
    int ny2 = int( x2*sin(angle) + y2*cos(angle) +y);
    
    int nx3 = int( x3*cos(angle) - y3*sin(angle) +x);
    int ny3 = int( x3*sin(angle) + y3*cos(angle) +y);
    
    quad(x, y, nx1, ny1, nx2, ny2, nx3, ny3);
  }

  
  void step() {
    int moveX = int(random(11)) - 5;
    int moveY = int(random(11)) - 5;
    
    x += moveX;
    y += moveY;
  }
}

Bactery[] bacteria;
int numBact = 100;
int bactWidth = 2;
int bactHeight = 10;

void setup() {
  size(500, 400);
  
  bacteria = new Bactery[numBact];
  for(int i=0; i<numBact; i++) {
    bacteria[i] = new Bactery();
  }
}

void draw() {
  background(255,255,255);
  
  for(int i=0; i<numBact; i++) {
    bacteria[i].step();
    bacteria[i].display();
  }
}

