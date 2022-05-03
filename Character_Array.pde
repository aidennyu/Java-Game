int size = 20;

class CharacterObject {
  int health_points;
  int current_health_points;
  int x_position, y_position;
  boolean dead;
  
  CharacterObject (int hp, int x, int y) {
    health_points = hp;
    current_health_points = hp;
    x_position = x;
    y_position = y;
    dead = false;
  }
  
void display() 
     {
        stroke(0);
        fill(0,0,255);
        ellipseMode(CENTER);
        ellipse(x_position * 50 + 25,y_position * 50 + 25,25,25);
        
        
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

  void is_dead() {
    if (current_health_points <= 0) {
       
    }
  }
  
  void setXPos(int unitXPos)
     {
         x_position += (unitXPos);
     }
  
  int getXPos()
     {
         return x_position;
     }
  
  void setYPos(int unitYPos)
     {
         y_position += (unitYPos);
     }
  
  int getYPos()
     {
         return y_position;
     } 
  

 
}
