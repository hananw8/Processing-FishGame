// Global variables
Player player;
ArrayList<Enemy> enemies; 
ArrayList<Kraken> krakens;
ArrayList<Collect> collectibles; 
int score = 0;
int lives = 3;
PImage picture;
int bgX, bgY;
int steps = 5;
color collisionColor = color(255, 0, 0); // Collision color (red) 
int collisionEffectDuration = 10; // Duration of collision effect 
int collisionEffectCounter = 0;
boolean gameOver = false; // Variable to track game over state

void setup() {
  size(800, 500);
  picture = loadImage("Background.png");
  picture.resize(width, height);
  bgX = 0;
  bgY = 0;

  player = new Player(400, 250, 3);
  enemies = new ArrayList<Enemy>(); 
  for (int i = 0; i < 4; i++) { 
    enemies.add(new Box(random(width), random(-50, -10), 1));
  }
  for (int i = 0; i < 4; i++) { 
    enemies.add(new Shark(random(width), random(-50, -10), 1));
  }
  krakens = new ArrayList<Kraken>(); 
  for (int i = 0; i < 2; i++) { 
   boolean movingRight = ((i & 1) == 0); // Change starting direction
    krakens.add(new Kraken((movingRight ? 0 : width), 0, 1, movingRight));
  }
  collectibles = new ArrayList<Collect>(); 
  for (int i = 0; i < 4; i++) { 
    collectibles.add(new Collect(random(width), random(-50, -10), 1)); 
  } 
}

void draw() {
  displayBackground();
  fill(0);
  textSize(20);
  text("x: " + bgX + " y: " + bgY, 20, 20);
  text("Score: " + score, 40, 40);
  text("Lives: " + lives, 60, 60); // Display the player lives
  if (collisionEffectCounter > 0) { 
    tint(collisionColor); // Apply collision color effect 
    collisionEffectCounter--; 
  } else { 
    noTint(); // Reset to normal color
  }

  player.display();
  for (Collect collect : collectibles) { 
    collect.display();
    if (collect.collidesWith(player)) {
      collect.resetPosition();
      score++;
      }
    }
  for (Enemy enemy : enemies) {
    enemy.display(); 
    if (enemy.collidesWith(player)) { 
      enemy.resetPosition();
      collisionEffectCounter = collisionEffectDuration; // Trigger collision effect
      lives--; // Decrease player lives when colliding  
      if (lives <= 0) { // Game-over 
        gameOver = true; 
        noLoop();  
      } 
    }
  }
  for (Kraken kraken : krakens) {
    kraken.display(); 
    if (kraken.collidesWith(player)) { 
      kraken.resetPosition();
      collisionEffectCounter = collisionEffectDuration; // Trigger collision effect
      lives--; // Decrease player lives when colliding  
      if (lives <= 0) { // Game-over 
        gameOver = true; 
        noLoop(); 
      } 
    }
  }
}

void displayBackground() {
  if (bgX >= width) {
    bgX = bgX - width;
  } else if (bgX < 0) {
    bgX = bgX + width;
  }

  if (bgY >= height) {
    bgY = bgY - height;
  } else if (bgY < 0) {
    bgY = bgY + height;
  }

  for (int col = -1; col < 2; col++) {
    for (int row = -1; row < 2; row++) {
      image(picture, bgX + (width * col), bgY + (height * row));
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    player.setDirection(-1, 0); // Face left
    for (Collect collect : collectibles) { 
      collect.moveRight();
    }
    for (Enemy enemy : enemies) {
      enemy.moveRight();
    }
    for (Kraken kraken : krakens) {
      kraken.moveRight();
    }
    bgX = bgX + steps;
  } else if (keyCode == RIGHT) {
    player.setDirection(1, 0); // Face right
    for (Collect collect : collectibles) { 
      collect.moveLeft();
    }
    for (Enemy enemy : enemies) {
      enemy.moveLeft();
    }
    for (Kraken kraken : krakens) {
      kraken.moveLeft();
    }
    bgX = bgX - steps;
  } else if (keyCode == UP) {
    player.setDirection(0, -1); // Face up
    for (Collect collect : collectibles) { 
      collect.moveDown();
    }
    for (Enemy enemy : enemies) {
      enemy.moveDown();
    }
    for (Kraken kraken : krakens) {
      kraken.moveDown();
    }
    bgY = bgY + steps;
  } else if (keyCode == DOWN) {
    player.setDirection(0, 1); // Face down
    for (Collect collect : collectibles) { 
      collect.moveUp();
    }
    for (Enemy enemy : enemies) {
      enemy.moveUp();
    }
    for (Kraken kraken : krakens) {
      kraken.moveUp();
    }
    bgY = bgY - steps;
  }

  // Background scrolling
  if (bgX > width) bgX = 0;
  if (bgX < -width) bgX = 0;
  if (bgY > height) bgY = 0;
  if (bgY < -height) bgY = 0;
}
