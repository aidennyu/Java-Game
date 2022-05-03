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
  
  
  void setHealth(int unitHealth)
  {
    this.health = unitHealth;
  }
  
  int getHealth()
  {
    return this.health; 
  }
  
  void setAttack(int unitAttack)
  {
    this.attack = unitAttack;
  }
  
  int getAttack()
  {
    return this.attack;
  }
  
  void setDefense(int unitDefense)
  {
    this.defense = unitDefense;
  }
  
  int getDefense()
  {
    return this.defense;
  }
  
  void setXPos(int unitXPos)
  {
    this.xPos = unitXPos;
  }

  int getXPos()
  {
    return this.xPos;
  }

  void setYPos(int unitYPos)
  {
    this.yPos = unitYPos;
  }

  int getYPos()
  {
    return this.yPos;
  }

  void display()
  {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xPos * 50 + 25, yPos * 50 + 25, 25, 25);
  }
}
