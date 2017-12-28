Ball ball;
Paddle paddle;
ArrayList<Block> blocks = new ArrayList<Block>();
int col, row;

void setup() {
  size(640, 340);
  frameRate(50);
  ball = new Ball();
  paddle = new Paddle();

  for (col = 0; col < 8; col++) {
    for (row = 1; row < 4; row++) {
      Block block = new Block(col, row);
      blocks.add(block);
    }
  }
}

void draw () {
  background(255);
  if (ball.myBall < 1) {
    ball.gameOver();
  } else {
    ball.gameLifeView(ball.myBall);
    ball.display();
    ball.update();
    ball.collideWall();
    ball.checkPaddle(paddle);
    paddle.display();
    paddle.update();
  }

  for (int i=0; i < blocks.size(); i++) {
    Block block = (Block)blocks.get(i);
    ball.checkblock(block);
    block.display();
  }
}

void mousePressed() {
  ball.myBall = 5;
  ball = new Ball();
  paddle = new Paddle();
}