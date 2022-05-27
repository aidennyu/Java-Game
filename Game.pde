// Global variables //<>//

// Array of characters
Character[] character_array;

// Initialize (temperary) amount of friendly and enemy characters
int character_count = 4;
int enemy_count = 5;

// 2D array that'll hel keep track of initial starting positions of characters
int[][] initial_positions;

// How far from the edge of the screen is the border?
int border = 3;

// Initialize the cursor coordinates to be at the top left corner
int cursor_x = border;
int cursor_y = border;

// Initialize the variables that will store how many columns and rows there are
int columns, rows;

// Initialize the coordinates of the charactures, used for the randomization of locations
int character_x, character_y;

// Initialize the size of each square in the grid
int box_size = 50;

// Set initial selection to be false (you can't be selecting anything when you start the game
boolean selection = false;
Character current_selection;
boolean attack_selection = false;
Character attacker;

// Our turn first!
boolean our_turn = true;

// Move range restrictions
int move_max = 2;

// To remember our original position when moving a character
int mem_character_x, mem_character_y;

int timer;
int attack_value;


// Function on start-up
void setup() {

  // Initialize the size of the game window
  size(1000, 1000);

  // Find the amount of columns and the amount of rows needed
  columns = width / box_size;
  rows = height / box_size;

  // Initialize the character array and initial positions 2D array
  character_array = new Character[character_count + enemy_count];
  initial_positions = new int[character_count + enemy_count][2];

  // Current selection is currently not selected to anything
  current_selection = null;
  attacker = null;
  
  timer = 0;

  // Variable to check if characters have the same coordinates
  boolean same_coordinates;

  // Randomized initialization for team
  for (int i = 0; i < character_count; i++) {

    same_coordinates = false;

    // Randomize the x and y coordinates of the character
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));

    // Check if the x and y coordinates match any other character
    for (int j = 0; j < initial_positions.length; j++) {
      if (character_x == initial_positions[j][0] && character_y == initial_positions[j][1]) {
        same_coordinates = true;
        i--;
        break;
      }
    }

    // If not, then make a new Character with those coordinates
    if (!same_coordinates) {
      character_array[i] = new Character(100, border + character_x, border + character_y, 10, 10, true, move_max);
    }
  }

  // Randomized initialization for enemy
  for (int k = character_count; k < enemy_count + character_count; k++) {
    same_coordinates = false;

    // Randomize the x and y coordinates of the character
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));

    // Check if the x and y coordinates match any other character
    for (int l = 0; l < initial_positions.length; l++) {
      if (character_x == initial_positions[l][0] && character_y == initial_positions[l][1]) {
        same_coordinates = true;
        k--;
        break;
      }
    }

    // If not, then make a new Character with those coordinates
    if (!same_coordinates) {
      character_array[k] = new Character(100, border + character_x, border + character_y, 10, 10, false, move_max);
    }
  }
}


// Function that refreshes every frame
void draw() {
  background(255);
  stroke(0);

  // Drawing the board / grid
  for (int i = border; i < columns - border; i++) {
    for (int j = border; j < rows - border; j++) {
      fill(225);

      if (selection && j <= mem_character_x + current_selection.moves && 
          i <= mem_character_y + current_selection.moves && 
          j >= mem_character_x - current_selection.moves &&
          i >= mem_character_y - current_selection.moves && 
          !(j == cursor_x && i == cursor_y) &&
          !(j == mem_character_x && i == mem_character_y)) {
        fill(0, 255, 0);
      }

      rect(j * box_size, i * box_size, box_size, box_size);
    }
  }

  // Drawing the cursor
  boolean on_character = false;
  int character_index = 0;

  // Check if the cursor is on a character
  for (var l = 0; l < character_array.length; l++) {
    if (cursor_y == character_array[l].y_position && cursor_x == character_array[l].x_position) {
      on_character = true;
      character_index = l;
      break;
    }
  }
  
  // Deselect if selected character is dead
  if (selection) {
    if (current_selection.is_dead()) {
      selection = false; 
    }
  }

  if (on_character) {
    if (!selection) {
      if (our_turn) {
        if (character_array[character_index].friend) {
          if (character_array[character_index].is_dead()) {
            
            // Character is dead, so colour red
            fill(255, 0, 0, 100);
          } else {
            
            // Character is alive, so colour green
            fill(0, 255, 0, 100); 
          }
        } else {

          // Cursor is on an enemy character, so colour red
          fill(255, 0, 0, 100);
        }
      } else {
        if (!character_array[character_index].friend) {
          if (character_array[character_index].is_dead()) {
            
            // Character is dead, so colour red
            fill(255, 0, 0, 100);
          } else {
            
            // Character is alive, so colour green
            fill(0, 255, 0, 100); 
          }
        } else {

          // Cursor is on an enemy character, so colour red
          fill(255, 0, 0, 100);
        }
      }
    } else {

      // Character is currently selected, so colour black
      fill(0, 0, 0, 100);
    }
  } else {

    // Cursor is not on any character, so colour red
    fill(255, 0, 0, 100);
  }

  rect(cursor_x * box_size, cursor_y * box_size, box_size, box_size);

  // Drawing the characters
  for (int k = 0; k < character_array.length; k++) {
    character_array[k].display();
  }

  fill(0);
  textSize(20);

  // Drawing other texts
  if (selection) {
    text(current_selection.current_health_points + " / " + current_selection.health_points, 50, 50);
  }
  
  if (attack_selection) {
    text("Attack a player...", 50, 50); 
  }
  
  if (timer > 0) {
    text("Dealt " + attack_value + " damage!", 500, 50);
    timer -= 5;
  }

  text("Our Turn: " + our_turn, 50, 100);
}


// Function that checks if any two characters overlap
boolean overlap() {
  boolean same_space = false;

  // Check if any two characters are overlaping
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


// Attack function
int attack(Character character_1, Character character_2) {
  int attack_value = 0;
  
  if (character_2.health_points > 0) {
    int base_damage = 1;
    float luck = random(2) + 1;
    
    attack_value = int((base_damage * (character_1.health_points / 10) * (character_1.attack / character_2.defence)) * luck);
    character_2.current_health_points -= attack_value;
    
    if (character_2.current_health_points < 0) {
      character_2.current_health_points = 0;
      character_2.is_dead();
    }
    
    selection = false;
    character_1.can_attack = false;
    
    if (our_turn) {
      our_turn = false; 
    } else {
      our_turn = true; 
    }
  }
  
  return attack_value;
}


// Function that calls when a key is pressed
void keyPressed() {
  boolean character_moved = true;

  // Keys to move the character if selected
  if (selection && key == CODED) {
    if (keyCode == UP) {

      // Move character up
      current_selection.change_y(-1);

      if (overlap() || current_selection.y_position < border || current_selection.y_position < mem_character_y - current_selection.moves) {

        // Move is illegal, so go back
        current_selection.change_y(1);
        character_moved = false;
      }
    } else if (keyCode == DOWN) {

      // Move character down
      current_selection.change_y(1);

      if (overlap() || current_selection.y_position > rows - (border + 1) || current_selection.y_position > mem_character_y + current_selection.moves) {

        // Move is illegal, so go back
        current_selection.change_y(-1);
        character_moved = false;
      }
    } else if (keyCode == RIGHT) {

      // Move character right
      current_selection.change_x(1);

      if (overlap() || current_selection.x_position > columns - (border + 1) || current_selection.x_position > mem_character_x + current_selection.moves) {

        // Move is illegal, so go back
        current_selection.change_x(-1);
        character_moved = false;
      }
    } else if (keyCode == LEFT) {

      // Move character left
      current_selection.change_x(-1);

      if (overlap() || current_selection.x_position < border || current_selection.x_position < mem_character_x - current_selection.moves) {

        // Move is illegal, so go back
        current_selection.change_x(1);
        character_moved = false;
      }
    }
  }

  // Keys to move the cursor
  if (key == CODED) {
    if (keyCode == UP && cursor_y > border) {

      // Move cursor up
      cursor_y -= 1;

      if (!character_moved) {

        // Character didn't move, so cursor can't move; go back
        cursor_y += 1;
      }
    } else if (keyCode == DOWN && cursor_y < rows - (border + 1)) {

      // Move cursor down
      cursor_y += 1;

      if (!character_moved) {

        // Character didn't move, so cursor can't move; go back
        cursor_y -= 1;
      }
    } else if (keyCode == RIGHT && cursor_x < columns - (border + 1)) {

      // Move cursor right
      cursor_x += 1;

      if (!character_moved) {

        // Character didn't move, so cursor can't move; go back
        cursor_x -= 1;
      }
    } else if (keyCode == LEFT && cursor_x > border) {

      // Move cursor left
      cursor_x -= 1;

      if (!character_moved) {

        // Character didn't move, so cursor can't move; go back
        cursor_x += 1;
      }
    }
  }
  
  if (!selection) {
    
    // Keys to select a character
    for (int i = 0; i < character_array.length; i++) {
      if (cursor_y == character_array[i].y_position && cursor_x == character_array[i].x_position && (key == 'Q' || key == 'q') && !character_array[i].dead) {
        if (our_turn) {
          if (character_array[i].friend) {
  
            // Remember initial coordinates
            mem_character_x = cursor_x;
            mem_character_y = cursor_y;
  
            current_selection = character_array[i];
            selection = true;
            break;
          }
        } else {
          if (!character_array[i].friend) {
  
            // Remember initial coordinates
            mem_character_x = cursor_x;
            mem_character_y = cursor_y;
  
            current_selection = character_array[i];
            selection = true;
            break;
          }
        }
        
      // Keys to attack select and attack a character
      } else if (cursor_y == character_array[i].y_position && cursor_x == character_array[i].x_position && (key == 'A' || key == 'a') && !character_array[i].dead) {
        if (!attack_selection) {
          if (our_turn && character_array[i].friend) {
            mem_character_x = cursor_x;
            mem_character_y = cursor_y;
            
            attack_selection = true;
            attacker = character_array[i];
            break;
          } else if (!our_turn && !character_array[i].friend) {
            mem_character_x = cursor_x;
            mem_character_y = cursor_y;
            
            attack_selection = true;
            attacker = character_array[i];
            break;
          }  
        } else {
          if (our_turn && !character_array[i].friend) {
            timer = 1000;
            attack_value = attack(attacker, character_array[i]); 
            attack_selection = false;
          } else if (!our_turn && character_array[i].friend) {
            timer = 1000;
            attack_value = attack(attacker, character_array[i]); 
            attack_selection = false;
          }
        }
      }
    }
  } else {
    if (key == 'Q' || key == 'q') {
      selection = false;
     
      // Check if character has moved from initial position
      if (current_selection.x_position != mem_character_x || current_selection.y_position != mem_character_y) {
        if (our_turn) {
          our_turn = false;
          
          for (int i = 0; i < character_array.length; i++) {
            if (!character_array[i].can_attack) {
              character_array[i].can_attack = true; 
            }
          }
        } else {
          our_turn = true;
          
          for (int i = 0; i < character_array.length; i++) {
            if (!character_array[i].can_attack) {
              character_array[i].can_attack = true; 
            }
          }
        }
      } 
    }
  }
}
