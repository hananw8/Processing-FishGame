class Kraken {
  float x, y, speed;
  PImage img1, img2, img3, img4;
  boolean movingRight;
  int imageCounter = 0;
  Kraken(float x, float y, float speedy, boolean movingRight) { // Constructor
    this.x = x;
    this.y = y;
    this.speed = speedy;
    this.movingRight = movingRight;
    img1=loadImage("Kraken1.png"); 
    img2=loadImage("Kraken2.png"); 
    img3=loadImage("Kraken3.png"); 
    img4=loadImage("Kraken4.png");
  }
  
  void display() {
     if(imageCounter >= 0 && imageCounter < 10) 
    image(img1,this.x, this.y); 
    else if(imageCounter >= 10 && imageCounter < 20) 
    image(img2,this.x, this.y); 
    else if(imageCounter >= 20 && imageCounter < 40) 
    image(img3,this.x, this.y); 
    else if(imageCounter >= 40 && imageCounter < 60) 
    image(img4,this.x, this.y); 
     
    imageCounter=imageCounter+1; 
    if(imageCounter>=60) 
    imageCounter=0;
    
    

    // Move in cross
    if (movingRight) {
      x = x + speed;
    } else {
      x = x - speed;
    }
    y = y + speed;
    
    // Reset position
    if (y > height) {
      resetPosition();
    }
  }

  void resetPosition() {
    // Randomly select the corners
    if (random(1) < 0.5) {
      x = 0; // Top left corner
      movingRight = true;
    } else {
      x = width; // Top right corner
      movingRight = false;
    }
    y = 0; // Spawn at the top
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
