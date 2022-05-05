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
        ellipse(xPos * 50 + 25,yPos * 50 + 25,25,25);
        
        
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
     
     
  
  }
