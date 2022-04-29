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
  
  void display() {
    ellipseMode(CENTER);
    ellipse(x_position, y_position, size, size);
  }
  
  void is_dead() {
    if (current_health_points <= 0) {
       
    }
  }
}
