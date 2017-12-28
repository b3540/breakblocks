class Ball {
  // variable 
  PVector loc;
  PVector vel;
  float r;
  int time;
  int myBall;

  // constractor
  Ball() {
    this.loc = new PVector(width / 2, 100);
    this.vel = new PVector(random(-4, 4), 4);
    this.r = 10;
    this.time = 0;
    this.myBall = 5;
  }

  // display method
  void display() {
    fill(1);
    ellipse(this.loc.x, this.loc.y, this.r * 2, this.r * 2 );
  }

  // update method
  void update() {
    this.loc.add(this.vel);
  }

  void collideWall() {
    if (this.loc.x + this.r > width) {
      this.vel.x *= -1;
    } else if (this.loc.x - this.r < 0) {
      this.vel.x *= -1;
    } else if (this.loc.y - this.r < 0) {
      this.vel.y *= -1;
    } else if (this.loc.y + this.r > height) {
      this.myBall--;
      restartBall();
    }
  }

  void checkPaddle(Paddle paddle) {
    if (this.loc.y + this.r > paddle.y &&
      this.loc.y - this.r < paddle.y + paddle.h &&
      this.loc.x > paddle.x &&
      this.loc.x < paddle.x + paddle.w
      ) {
      this.vel.y *= -1;
      if (paddle.x + (paddle.w * 0.15) > this.loc.x && this.vel.x > 0) {
        this.vel.x *= -1;
      } else if (paddle.x + (paddle.w * 0.85) < this.loc.x && this.vel.x < 0){
        this.vel.x *= -1;        
      }
    }
  }

  void checkblock(Block block) {
    if (this.loc.y + this.r > block.loc.y &&
      this.loc.y - this.r < block.loc.y + block.h &&
      this.loc.x > block.loc.x &&
      this.loc.x < block.loc.x + block.w
      ) {
      if (this.vel.x > 0) {
        this.vel.x = random(-4, -1);
      } else {
        this.vel.x = random(1, 4);        
      }  
      this.vel.y *= -1;
      block.life--;
      if (block.life < 1) {
        block.w = 0;
        block.h = 0;
      }
    }
  }

  void restartBall() {
    this.time = 0;
    this.loc.x = width / 2;
    this.loc.y = 100;
    this.vel.x = random(-4, 4);
    this.vel.y = 4;
  }
  
  void gameLifeView(int myBall) {
    this.time++;
    if (this.time < 30) {
      fill(128);
      textSize(64);
      text(myBall, width / 2, height / 2 );
    }
  }
  
  void gameOver() {
    fill(128);
    textSize(36);
    text("Game Over", width / 2 - 90, height / 2);
    textSize(24);
    text("Click for New Game", width / 2 - 100, height / 2 + 50);
  }
}