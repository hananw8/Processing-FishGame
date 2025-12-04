class Player{
  float x, y ,speed ,angle;
  PImage img1, img2;
  int imageCounter = 0;
  
  Player(float x, float y, float speedy){ // Constructor
    this.x = x;
    this.y = y;
    this.speed = speedy;
    img1 = loadImage("Player1.png");
    img2 = loadImage("Player2.png");
    imageMode(CENTER);
  }
  // Methods
void display() {
    pushMatrix();
    translate(x, y); // Player position
    rotate(radians(angle)); // Rotate player angle
    if (imageCounter < 15) {
        image(img1, 0, 0);
    } else {
        image(img2, 0, 0);
    }
    imageCounter++;
    if (imageCounter >= 30) {
        imageCounter = 0; // Manually wrap around
    }
    popMatrix();
}


  void setDirection(float dx, float dy) {
    angle = degrees(atan2(dy, dx)) + 90;
  }
}
