class Collect {
  float x, y, speed;
  PImage img1;
  
  Collect(float x, float y, float speedy) { // constructor
    this.x = x;
    this.y = y;
    this.speed = speedy;
    img1 = loadImage("Collect.png");
  }
  
  void display() {
    image(img1, this.x, this.y);
    
    // Move downward
    y = y + 0.5;
    
    // Reset x, y coordinates
    if (y > height || x < 0 || x > width) {
      resetPosition();
    }
  }
  
  void resetPosition() {
    // Set x and y to random position
    x = random(0, width);
    y = random(-50, -10); 
  }

  boolean collidesWith(Player player) {
    return dist(this.x, this.y, player.x, player.y) < 25; 
  }
  void moveRight() {
  x = x + speed;
  }
  void moveLeft() {
  x = x - speed;
  }
  void moveUp() {
  y = y - speed;
  }
  void moveDown() {
  y = y + speed;  
  }
}
