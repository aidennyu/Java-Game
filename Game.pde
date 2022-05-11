// Global variables
Character[] character_array;
int character_count = 4;
int enemy_count = 5;

int[][] initial_positions;


int border = 3;
int cursor_x = border;
int cursor_y = border;

int columns, rows;

int character_x, character_y;

int box_size = 50;

boolean selection = false;
Character current_selection;


// Function on start-up
void setup() {
  size(1000, 1000);
  
  columns = width / box_size;
  rows = height / box_size;
  
  character_array = new Character[character_count + enemy_count];
  initial_positions = new int[character_count + enemy_count][2];
  
  current_selection = null;
  
  boolean same_coordinates;
  
  // Randomized initialization for team
  for (int i = 0; i < character_count; i++) { //<>//
    same_coordinates = false;
    
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));
    
    for (int j = 0; j < initial_positions.length; j++) {
      if (character_x == initial_positions[j][0] && character_y == initial_positions[j][1]) {
        same_coordinates = true;
        i--;
        break;
      }
    }
    
    if (!same_coordinates) {
      character_array[i] = new Character(100, border + character_x, border + character_y, 100, 100, true); 
    }
  }
  
  // Randomized initialization for enemy
  for (int k = character_count; k < enemy_count + character_count; k++) {
    same_coordinates = false;
    
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));
    
    for (int l = 0; l < initial_positions.length; l++) {
      if (character_x == initial_positions[l][0] && character_y == initial_positions[l][1]) {
        same_coordinates = true;
        k--;
        break;
      }
    }
    
    if (!same_coordinates) {
      character_array[k] = new Character(100, border + character_x, border + character_y, 100, 100, false); 
    }
  }
}


// Function that refreshes every frame
void draw() {
  background(255);
  fill(225);
  stroke(0);
  
  for (int i = border; i < columns - border; i++) {
    for (int j = border; j < rows - border; j++) {
      rect(i * box_size, j * box_size, box_size, box_size);
    }
  }
  
  boolean on_character = false;
<<<<<<< Updated upstream
  
  for (var l = 0; l < character_count; l++) {
    if (cursor_y == character_array[l].y_position && cursor_x == character_array[l].x_position) {   
      on_character = true;
=======
  int character_index = 0;
  
  for (var l = 0; l < character_array.length; l++) {
    if (cursor_y == character_array[l].y_position && cursor_x == character_array[l].x_position) {   
      on_character = true;
      character_index = l;
>>>>>>> Stashed changes
      break;
    } 
  }
  
  if (on_character) {
<<<<<<< Updated upstream
    fill(0, 255, 0, 100); 
=======
    if (character_array[character_index].friend) {
      fill(0, 255, 0, 100);
    } else {
      fill(255, 0, 0, 100); 
    }
>>>>>>> Stashed changes
  } else {
    fill(255, 0, 0, 100);
  }
  
  rect(cursor_x * box_size, cursor_y * box_size, box_size, box_size);
  
  for (int k = 0; k < character_array.length; k++) {
    character_array[k].display();
  }
  
  if (selection) {
    fill(0);
    textSize(20);
    text(current_selection.current_health_points + " / " + current_selection.health_points, 50, 50); 
  }
}


// Function that checks if any two characters overlap
boolean overlap() {
  boolean same_space = false;
  
  for (int i = 0; i < character_array.length; i++) {
    for (int j = 0; j < character_array.length; j++) {
      if (i != j && character_array[i].x_position == character_array[j].x_position && character_array[i].y_position == character_array[j].y_position) {
        same_space = true;
        break;
      }
    }
    
    if (same_space) {
      break; 
    }
  }
  
  return same_space;
}


// Function that calls when a key is pressed
void keyPressed() {
  boolean character_moved = true;
  
  // Keys to move the character if selected
  if (selection && key == CODED && current_selection.friend) {
    if (keyCode == UP && current_selection.y_position > border) {
      current_selection.change_y(-1);
      
      if (overlap()) {
        current_selection.change_y(1);
        character_moved = false;
      }
    } else if (keyCode == DOWN && current_selection.y_position < rows - (border + 1)) {
      current_selection.change_y(1);
      
      if (overlap()) {
        current_selection.change_y(-1);
        character_moved = false;
      }
    } else if (keyCode == RIGHT && current_selection.x_position < columns - (border + 1)) {
      current_selection.change_x(1);
      
      if (overlap()) {
        current_selection.change_x(-1);
        character_moved = false;
      }
    } else if (keyCode == LEFT && current_selection.x_position > border) {
      current_selection.change_x(-1);
      
      if (overlap()) {
        current_selection.change_x(1);
        character_moved = false;
      }
    }
  }
  
  // Keys to move the cursor
  if (key == CODED) {
    if (keyCode == UP && cursor_y > border) {
      cursor_y -= 1;
      
      if (!character_moved) {
        cursor_y += 1; 
      }
    } else if (keyCode == DOWN && cursor_y < rows - (border + 1)) {
      cursor_y += 1;
      
      if (!character_moved) {
        cursor_y -= 1; 
      }
    } else if (keyCode == RIGHT && cursor_x < columns - (border + 1)) {
      cursor_x += 1;
      
      if (!character_moved) {
        cursor_x -= 1; 
      }
    } else if (keyCode == LEFT && cursor_x > border) {
      cursor_x -= 1;
      
      if (!character_moved) {
        cursor_x += 1; 
      }
    }
  }
  
  // Keys to select a character
  for (int i = 0; i < character_array.length; i++) {
    if (cursor_y == character_array[i].y_position && cursor_x == character_array[i].x_position && (key == 'Q' || key == 'q') && !selection && !character_array[i].dead && character_array[i].friend) {
      current_selection = character_array[i];
      selection = true;
      break;
    }
  }
  
  // Keys to deselect a character
  if (key == 'R' || key == 'r') {
    selection = false; 
  }
}
