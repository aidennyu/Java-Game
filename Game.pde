/*
  Author: Jovian Kuntjoro
  
  Description: 
  This is the main code to a mini RPG game the Gr. 12's and me (cause I'm Gr. 11) are going to make as a "final project"
  This is my branch of the game and soon, most probably, this code is going to be used in the final code for the finished game.
*/


// Global variables

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
  
  // Variable to check if characters have the same coordinates
  boolean same_coordinates;
  
  // Randomized initialization for team
  for (int i = 0; i < character_count; i++) { //<>//
    
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
      character_array[i] = new Character(100, border + character_x, border + character_y, 100, 100, true); 
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
      character_array[k] = new Character(100, border + character_x, border + character_y, 100, 100, false); 
    }
  }
}


// Function that refreshes every frame
void draw() {
  background(255);
  fill(225);
  stroke(0);
  
  // Drawing the board / grid
  for (int i = border; i < columns - border; i++) {
    for (int j = border; j < rows - border; j++) {
      rect(i * box_size, j * box_size, box_size, box_size);
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
  
  if (on_character) {
    if (character_array[character_index].friend && !selection) {
      
      // Cursor is on character, but not selected, so colour green
      fill(0, 255, 0, 100);
    } else if (selection) {
      
      // Cursor is currently selecting a character, so colour black
      fill(0, 0, 0, 100); 
    } else {
      
      // Cursor is on a enemy character, so colour red
      fill(255, 0, 0, 100); 
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
  
  // Drawing other texts
  if (selection) {
    fill(0);
    textSize(20);
    text(current_selection.current_health_points + " / " + current_selection.health_points, 50, 50); 
  }
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


// Function that calls when a key is pressed
void keyPressed() {
  boolean character_moved = true;
  
  // Keys to move the character if selected
  if (selection && key == CODED && current_selection.friend) {
    if (keyCode == UP && current_selection.y_position > border) {
      
      // Move character up
      current_selection.change_y(-1);
      
      if (overlap()) {
        
        // Move is illegal, so go back
        current_selection.change_y(1);
        character_moved = false;
      }
    } else if (keyCode == DOWN && current_selection.y_position < rows - (border + 1)) {
      
      // Move character down
      current_selection.change_y(1);
      
      if (overlap()) {
        
        // Move is illegal, so go back
        current_selection.change_y(-1);
        character_moved = false;
      }
    } else if (keyCode == RIGHT && current_selection.x_position < columns - (border + 1)) {
      
      // Move character right
      current_selection.change_x(1);
      
      if (overlap()) {
        
        // Move is illegal, so go back
        current_selection.change_x(-1);
        character_moved = false;
      }
    } else if (keyCode == LEFT && current_selection.x_position > border) {
      
      // Move character left 
      current_selection.change_x(-1);
      
      if (overlap()) {
        
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
