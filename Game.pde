// Global variables
Character[] character_array;
int character_count = 4;

int border = 3;
int cursor_x = border;
int cursor_y = border;

int columns, rows;

int box_size = 50;

boolean selection = false;
Character current_selection;


// Function on start-up
void setup() {
  size(1000, 1000);
  columns = width / box_size;
  rows = height / box_size;
  character_array = new Character[character_count];
  current_selection = null;
  
  for (int i = 0; i < character_count; i++) {
    character_array[i] = new Character(100, border * (i + 1), border * (i + 1), 100, 100, true);
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
  
  fill(255, 0, 0, 100);  
  rect(cursor_x * box_size, cursor_y * box_size, box_size, box_size);
  
  for (int k = 0; k < character_count; k++) {
    character_array[k].display();
  }
}


// Function that checks if any two characters overlap
boolean overlap() {
  boolean same_space = false;
  
  for (int i = 0; i < character_count; i++) {
    for (int j = 0; j < character_count; j++) {
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
  if (selection && key == CODED) {
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
  for (int i = 0; i < character_count; i++) {
    if (cursor_y == character_array[i].y_position && cursor_x == character_array[i].x_position && (key == 'Q' || key == 'q') && !selection && !character_array[i].dead) {
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
