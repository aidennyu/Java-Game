class Enemy {

   color c;
   int health;
   int attack;
   int defense;
   int xPos;
   int yPos;
   int enemyMaxHealth;

   Enemy(color c, int health, int enemyMaxHealth, int attack, int defense, int xPos, int yPos) {
     this.c = c;
     this.health = health;
     this.enemyMaxHealth = enemyMaxHealth;
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

   void setMaxHealth(int maxHP)
   {
     this.enemyMaxHealth = maxHP;
   }

   int getMaxHealth()
   {
     return this.enemyMaxHealth;
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

  void attack(Unit unit)
  {

    if (unit.getHealth() > 0) {

      //Using basic attack damage formula based on rng roll.
      //Damage from 1-4
      //luck range (max - min) + 1
      double maxLuck = 4.00;
      double minLuck = 1.00;
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

      int COATK = getAttack();
      int CODEF = unit.getDefense();

      int attackValue = (int)(Math.random() * (COATK/CODEF) + (1 + luck));

      unit.setHealth(unit.getHealth() - attackValue);
    }
  }
}
