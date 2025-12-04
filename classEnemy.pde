class Enemy {
  float x, y, speed;
  PImage img1, img2;
  int imageCounter = 0;

  Enemy(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  void display() {}

  void resetPosition() {
    x = random(0, width);
    y = random(-50, -10);
  }

  boolean collidesWith(Player player) {
    float halfWidth = img1.width / 2;
    float halfHeight = img1.height / 2;
    return !(player.x > x + halfWidth || player.x + player.img1.width < x - halfWidth ||  player.y > y + halfHeight || player.y + player.img1.height < y - halfHeight);
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
