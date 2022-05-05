class Enemy {

  color c;
  int health;
  int attack;
  int defense;
  int xPos;
  int yPos;

Enemy(color c, int health, int attack, int defense, int xPos, int yPos) {
    this.c = c;
    this.health = health;
    this.attack = attack;
    this.defense = defense;
    this.xPos = xPos;
    this.yPos = yPos;
  }

  void display()
  {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xPos * 50 + 25, yPos * 50 + 25, 25, 25);
  }
}
