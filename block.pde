class Block {
  PVector loc;
  float w, h;
  int life;

  Block(int col, int row) {
    this.w = 80;
    this.h = 20;
    this.loc = new PVector(col * this.w, row * this.h);
    this.life = 4 - row;
  }

  void display() {
    if (this.life == 0 ) {
      return;
    }
    fill(128);
    stroke(255);
    rect(this.loc.x, this.loc.y, this.w, this.h);
    fill(255);
    textSize(12);
    text(life, this.loc.x + 40, this.loc.y + 15);
  }
}