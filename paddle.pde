class Paddle {
  float x, y, w, h;
  Paddle() {
    this.x = 100;
    this.y = height - 10;
    this.w = 100;
    this.h = 5;
  }

  void update() {
    this.x = mouseX;
  }

  void display() {
    fill(0);
    rect(this.x, this.y, this.w, this.h);
  }
}