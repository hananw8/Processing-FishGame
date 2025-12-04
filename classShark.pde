class Shark extends Enemy {

  Shark(float x, float y, float speed) {
    super(x, y, speed);
    img1 = loadImage("Shark1.png");
    img2 = loadImage("Shark2.png");
  }

  void display() {
    if (imageCounter >= 0 && imageCounter < 20) {
      image(img1, this.x, this.y);
    } else if (imageCounter >= 20 && imageCounter < 40) {
      image(img2, this.x, this.y);
    }
    imageCounter = imageCounter + 1;
    if (imageCounter >= 40) {
      imageCounter = 0;
    }
    y = y + 0.5;

    if (y > height || x < 0 || x > width) {
      resetPosition();
    }
  }
}
