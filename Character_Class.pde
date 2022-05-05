class Character {

  color c;
  int cost;
  int health;
  int attack;
  int defense;
  int fuel;
  int ammo;
  int xPos;
  int yPos;

  //comment

  Character(color unitColor, int unitCost, int unitHealth, int unitDefense, int unitAttack, int unitFuel, int unitAmmo, int unitXPos, int unitYPos)
  {
    c = unitColor;
    cost = unitCost;
    health = unitHealth;
    defense = unitDefense;
    attack = unitAttack;
    fuel = unitFuel;
    ammo = unitAmmo;
    xPos = unitXPos;
    yPos = unitYPos;
  }

  void display()
  {
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xPos * 50 + 25, yPos * 50 + 25, 25, 25);


    //THIS SECTION IS FOR TESTING: the red ball's coordinates
    //print(xPos + " " + yPos + " ");

    /*
        Log 1
     maximum coordinates was 44 for some reason
     It cant go up or left.
     */

    /*
        Log 2
     It is skipping sqaures
     changing by 20s for some reason
     I somehow made it go up and left without touching anything
     */
  }

  void setCost(int unitCost)
  {
    cost = unitCost;
  }

  int getCost()
  {
    return cost;
  }

  void setHealth(int unitHealth)
  {
    health = unitHealth;
  }

  int getHealth()
  {
    return health;
  }

  void setAttack(int unitAttack)
  {
    attack = unitAttack;
  }

  int getAttack()
  {
    return attack;
  }

  void setDefense(int unitDefense)
  {
    defense = unitDefense;
  }

  int getDefense()
  {
    return defense;
  }

  void setFuel(int unitFuel)
  {
    fuel = unitFuel;
  }

  int getFuel()
  {
    return fuel;
  }

  void setAmmo(int unitAmmo)
  {
    ammo = unitAmmo;
  }

  int getAmmo()
  {
    return ammo;
  }

  void setXPos(int unitXPos)
  {
    xPos = unitXPos;
  }

  int getXPos()
  {
    return xPos;
  }

  void setYPos(int unitYPos)
  {
    yPos = unitYPos;
  }

  int getYPos()
  {
    return yPos;
  }

  /*
  attack*(100/(100+defense)) - basic attack formula
   
   Advance Wars 2 - formulas:
   
   AttackValue = (Base*(COATK/100))+Luck
   DefenseValue = (200-CODEF-TerrainStars*HP)/100
   TotalDamage = ((Attacker's HP)/10) * Attacker'sAttackValue * Defender'sDefenseValue
   
   Individual ATK and DEF refers to the corresponding CO's ATK and DEF values to specific units. Both default to 100 but may be modified based on given factors.
   Universal ATK and DEF refers to the corresponding CO's ATK and DEF values to all units. Both default to 100 when not having CO Power active, and 110 when having CO Power active, but may be different such as Eagle under Lightning Strike having 80 for ATK and 70 for DEF.
   Values for DEF with both actually use the subtraction result in the game's data
   Luck is a random number, choosing from 0 to 9 with any CO with the exceptions of Nell (0 to 19 daily, or 0 to 59 under Lucky Star) and Sonja (-15 to 9)
   */



  void attack(Enemy enemy)
  {
    //luck range (max - min) + 1
    double maxLuck = 0.09;
    double minLuck = 0.00;
    double range = (maxLuck - minLuck) + 1  ;

    //calculating luck
    int luck = (int)(Math.random() * range);

    /*calculating attack value
    DMG% = (((B * Aco)/100)) + L - Lb) * (HPa/10) * ((200-(Dco+Dtr*HPd))/100)
    Damage % = Actual damage, expressed as a percentage
    B = Base damage against that unit (see the table below)
    ACO = Attacking CO attack value (eg: 110 for Hawke)
    L = Luck damage, defaulting to a random number between 0 and 9
    LB = Bad luck damage, where applicable
    HPA = Visual HP of attacker (the displayed number from 1 through 10)
    DCO = Defending CO defense value (eg: 80 for Grimm)
    DTR = Defending Terrain Stars (e.g. 1 for Plains, 2 for Woods)
    HPD = Visual HP of defender (the displayed number from 1 through 10)
    
    Two rounding steps then occur at the end of the calculation, before the stated value is applied or shown in the damage tooltip and calculator:

    The value is rounded up to the nearest interval of 0.05.
    The value is rounded down to the nearest integer.
    
    READ: https://awbw.fandom.com/wiki/Damage_Formula
    */
    
    int COATK = 100;
    int CODEF = 100;

    int attackValue = (COATK/CODEF) + (1 + luck);


    enemy.setHealth(-attackValue);
    println("You attacked for " + attackValue + " damage! The enemy has " + enemy.getHealth() + "/" + enemy.getMaxHealth() + " health left");
  }
}
