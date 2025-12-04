class Box extends Enemy {

  Box(float x, float y, float speed) {
    super(x, y, speed);
    img1 = loadImage("Box1.png");
    img2 = loadImage("Box2.png");
  }

  void display() {
    if (imageCounter < 15) {
      image(img1, this.x, this.y);
    } else {
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
