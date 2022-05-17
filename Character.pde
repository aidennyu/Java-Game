// Class for the character
class Character {
  
  // Initialize the variables
  int health_points, current_health_points;
  int x_position, y_position;
  int attack, defence;
  boolean dead;
  boolean friend;
  int moves;
  
  // All the things a character should have
  Character(int hp, int x, int y, int a, int d, boolean f, int m) {
    health_points = hp;
    current_health_points = hp;
    x_position = x;
    y_position = y;
    attack = a;
    defence = d;
    friend = f;
    moves = m;
    dead = false;
  }
  
  // Function that displays the character
  void display() {
    stroke(0);
    
    if (friend && !dead) {
      
      // Character is a friend, colour blue
      fill(0, 0, 255);
    } else if (!friend && !dead) {
      
      // Character is an enemy, colour red
      fill(255, 0, 0); 
    } else if (dead) {
      
      // Character is dead, colour black
      fill(0); 
    }
    
    ellipseMode(CENTER);
    ellipse(x_position * 50 + 25, y_position * 50 + 25, 25, 25);
  }
  
  // Function that checks if the character is dead
  boolean is_dead() {
    dead = false;
    
    if (current_health_points <= 0) {
      dead = true;
    }
    
    return dead;
  }
  
  // Function that changes the character's x position
  void change_x(int change) {
    x_position += change;
  }
  
  // Function that changes the character's y position
  void change_y(int change) {
    y_position += change; 
  }
}
