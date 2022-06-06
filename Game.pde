// Global variables //<>//

//audio import setup for way later -
//import processing.sound.*;
//SoundFile menuSong;

//gamemenu
byte gameState = 0;

// Array of characters
Character[] character_array;

//Array of TERRAIN
Terrain[] terrain_array;

// Initialize (temperary) amount of friendly and enemy characters
int character_count = 5;
int enemy_count = 5;

// 2D array that'll help keep track of initial starting positions of characters
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

//Initialize terrain amount
int terrain_count = 6;

// Set initial selection to be false (you can't be selecting anything when you start the game
boolean selection = false;
Character current_selection;
//Number of people moved should equal total num of char on ur side before switching turns
int numCharMoved;

// Our turn first!
boolean our_turn = false;

//menu stuff
PImage menu;
PImage level;
PImage dog;
PImage settingsOption;
PImage settingsMenu;

byte selectorWixoss = 0;
byte levelSelect = 0;

int mem_character_x, mem_character_y;
// Function on start-up
void setup() {
  //images ini
  menu = loadImage("AdvancedCars2.jpg");
  level = loadImage("WorldSelect.jpg");
  dog = loadImage("dogCharacter.png");
  settingsOption = loadImage("Settings.png");
  settingsMenu = loadImage("SettingsMenu.jpg");
  
  //initialize audio:
  //menuSong = new SoundFile(this, "helghanForever.mp3");
  

// Move range restrictions
int move_max = 2;


// Function on start-up


  // Initialize the size of the game window
  size(1000, 1000);

  // Find the amount of columns and the amount of rows needed
  columns = width / box_size;
  rows = height / box_size;

  // Initialize the character array and initial positions 2D array
  character_array = new Character[character_count + enemy_count];
  initial_positions = new int[character_count + enemy_count][2];
  

  // Initialize TERRAIN array
  terrain_array = new Terrain[terrain_count];


  // Current selection is currently not selected to anything
  current_selection = null;

  // Variable to check if characters have the same coordinates
  boolean same_coordinates;
  
  //terrain generation
  //for (int t = 0; t < terrain_count; t++) {}
    terrain_array[0] = new Terrain(4, 4, true, "pond", 3);
    terrain_array[1] = new Terrain(4, 5, true, "pond", 3);
    terrain_array[2] = new Terrain(4, 6, true, "pond", 3);
    terrain_array[3] = new Terrain(4, 7, true, "pond", 3);
    terrain_array[4] = new Terrain(5, 4, true, "pond", 3);
    terrain_array[5] = new Terrain(5, 5, true, "pond", 3);
  
  

  // Randomized initialization for team
  //ALRIGHT I HAVE NO IDEA IF THIS WORKS 
  for (int i = 0; i < character_count; i++) {

    same_coordinates = false;

    // Randomize the x and y coordinates of the character
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));


     // Check if the x and y coordinates match placed terrain (idk if this works)
    for (int t = 0; t < initial_positions.length; t++) {
      for (int j = 0; j < terrain_array.length; j++) {
        if (terrain_array[j].xPos == initial_positions[t][0] && terrain_array[j].yPos == initial_positions[t][1]) {
          same_coordinates = true;
          print("terrain same");
          i--;
          break;
        }
      }
    }

    // Check if the x and y coordinates match any other character
    for (int j = 0; j < initial_positions.length; j++) {
      if (character_x == initial_positions[j][0] && character_y == initial_positions[j][1]) {
        same_coordinates = true;
        print("character same");
        i--;
        break;
      }
    }

    // If not, then make a new Character with those coordinates
    if (!same_coordinates) {
      character_array[i] = new Character(100, border + character_x, border + character_y, 100, 100, true, move_max);
    }
  }


  // Randomized initialization for enemy
  for (int k = character_count; k < enemy_count + character_count; k++) {
    same_coordinates = false;

    // Randomize the x and y coordinates of the character
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));
    //test for terrain coordinates
    //print(character_x + ", ");
    //println(character_y);
    //terrain_array[0].coordinate_Test();

     //Check if the x and y coordinates match any other character
    for (int l = 0; l < initial_positions.length; l++) {
      if (character_x == initial_positions[l][0] && character_y == initial_positions[l][1]) {
        same_coordinates = true;
        k--;
        break;
      }
    }

    // If not, then make a new Character with those coordinates
    if (!same_coordinates) {
      character_array[k] = new Character(100, border + character_x, border + character_y, 100, 100, false, move_max);
    }
  }
}


// Function that refreshes every frame
void draw() { //DRAW FUNCTION HEREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
  if (gameState == 0) {
    image(menu, 0, 0, 1000, 1000);
    image(settingsOption, 260, 433, 478, 84);
      
      noStroke();
      fill(255, 0, 0, 100);
      rect(200, 625 + 200 * selectorWixoss, 600, 100);
      
   /* this is the basic setup for audio
     if (menuSong.isPlaying() == false) {
      menuSong.amp(0.4);
      menuSong.play();
      menuSong.jump(21);
    }  */
    
    
  }
  
  if (gameState == 1) {
    image(level, 0, 0, 1776, 1000);
    
    noStroke();
    fill(255, 0, 0, 255);
    
    rect(210, 420, 50, 50);
    rect(330 + 180, 500, 50, 50);
    rect(630 + 180, 500, 50, 50);
    
    if (levelSelect == 0) {
    fill(255, 255, 0, 255);
    rect(210, 420, 50, 50);
    }
    if (levelSelect == 1) {
    fill(255, 255, 0, 255);
    rect(330 + 180, 500, 50, 50);
    }
    if (levelSelect == 2) {
    fill(255, 255, 0, 255);
    rect(630 + 180, 500, 50, 50);
    }
    
    if (levelSelect == 0)
    image(dog, 180, 340, 525/5, 510/5);
    
    if (levelSelect > 0)
    image(dog, 180 + 300 * levelSelect, 420, 525/5, 510/5);
   //to select a world justmake a new gamestate for that world
    
  }
  
  if (gameState == 2) {
    //menuSong.stop();
    
    background(255);
    fill(225);
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

  // Drawing the terrain
    for (int t = 0; t < terrain_array.length; t++) {
      terrain_array[t].display();
    }

  // Check if the cursor is on a character
  for (var l = 0; l < character_array.length; l++) {
    if (cursor_y == character_array[l].y_position && cursor_x == character_array[l].x_position) {
      on_character = true;
      character_index = l;
      break;
    }
  }
    //CURSOR COLOUR ====
    if (on_character) {
      if (!selection) {
        if (our_turn) {
          if (character_array[character_index].friend) {
            fill(0, 255, 0, 255);
          } else {
            fill(100, 99, 22, 255);
          }
        } else {
          if (!character_array[character_index].friend) {
            fill(50, 255, 50, 255);
          } else {
            fill(120, 120, 120, 255);
          }
        }
      } else {
        fill(70, 70, 70, 255); 
      }
    } else {
        if (our_turn) {
          fill(0, 0, 255, 255);
        }else {
          fill(255 ,153 ,153 ,255);
        }
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

  text("Our Turn: " + our_turn, 50, 100);
 }
 
 if (gameState == 3) {
    image(settingsMenu, 0, 0, 1000, 1000);
  }
}


// Function that checks if any two characters overlap
boolean overlap() {
  boolean same_space = false;

  //the overlap works by scanning the each charatcer's position with every other character in the array. If both coords are the same OVERLAP TRUE
  // the (i != j) means if the character is not itself, check for the x and y conditions.

  //Check if terrain and character are overlapping
  for (int i = 0; i < character_array.length; i++) {
    for (int j = 0; j < terrain_array.length; j++) {
      if (character_array[i].x_position == terrain_array[j].xPos && character_array[i].y_position == terrain_array[j].yPos && terrain_array[j].block == true) {
        same_space = true;
        break;
      }
    }
    
    if (same_space) {
      break;
    }
  }

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
void attack(Character character_1, Character character_2) {
  if (character_2.health_points > 0) {
    int range = 4;
    int luck = int(random(range));

    int attack = character_1.attack;
    int defence = character_2.defence;

    int attack_value = int(random(attack / defence) + (1 + luck));


    character_2.health_points -= attack_value;

  }
}


// Function that calls when a key is pressed
void keyPressed() {
      boolean character_moved = true;
      
      //=====================================================THIS IS THE MENU LINE RIHT HERE SO IM WRITING TH IS SO THIS LINE OF TEXT WONT MAKE ME GO SEARCHIGN FO RHTIS CODE GAIAnfthdfhjtgjh
        if (key == 'l' && gameState < 2) {
         if (selectorWixoss == -1) {
             gameState = 3;
             selectorWixoss = 0; //resets var to deafult
         } else {
           gameState++; 
           selectorWixoss = 0; //resets var
         }
        }
        if (key == 'k' && gameState > 0 && gameState != 2) {
          if (gameState == 3) {
             gameState = 0;
             selectorWixoss = -1; //resets var to settings slot
         } else {
           gameState--; 
           selectorWixoss = 0; //resets var
         }
        }
      
      if (gameState == 0) {
        if (key == CODED) {
          //MENU SLECTOR DRAW RECT HTIGN
          if (keyCode == DOWN && selectorWixoss != 0) {
             selectorWixoss += 1;
             print(selectorWixoss);
          }
          if (keyCode == UP && selectorWixoss != -1) {
             selectorWixoss -= 1;
             print(selectorWixoss);
          }
          
          
        }
      }
      
      if (gameState == 1) { //LEVEL SELECTORRRRRRRRRRRRRRRRRRRRR
      
        if (key == CODED) {
          //DOG MOVE
          if (keyCode == LEFT && levelSelect > 0) {
             levelSelect -= 1;
             println(levelSelect + "level");
          }
          if (keyCode == RIGHT && levelSelect < 2) { //2 is number of levels
             levelSelect += 1;
             println(levelSelect + "level");
          }
          
          
        }
      }
      //======================================================+++++++++++++++++++++++++++++++++++++++++++++++GAAAAAAAAAAAAAAAAAAAAAAAAAAAAMMMMMMMMMMMMMMMMEEEEEEEEEEEEE GAME CODE
      
      if (gameState == 2) {
        // Keys to move the character if selected
      if (selection && key == CODED) {
        if (keyCode == UP) {
    
          // Move character up
          current_selection.change_y(-1);
          //0,0 on the board is actually 4, 4 for some reason
    println(current_selection.x_position + ", " + current_selection.y_position);
  
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
      }


  if (!selection) {

    // Keys to select a character
    for (int i = 0; i < character_array.length; i++) {
      if (cursor_y == character_array[i].y_position && cursor_x == character_array[i].x_position && (key == 'Q' || key == 'q') && !character_array[i].dead && (character_array[i].getMoved() != true)) {
        if (our_turn) {
          if (character_array[i].friend) {

            // Remember initial coordinates
            mem_character_x = cursor_x;
            mem_character_y = cursor_y;
            character_array[i].setMoved(true); 
            character_array[i].can_attack = false;
            current_selection = character_array[i];
            selection = true;
            break;
          }
        } else {
          if (!character_array[i].friend) {

            // Remember initial coordinates
            mem_character_x = cursor_x;
            mem_character_y = cursor_y;
            character_array[i].setMoved(true); 
            character_array[i].can_attack = false;
            current_selection = character_array[i];
            selection = true;
            break;
          }

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
    }

  } else {
    if (key == 'Q' || key == 'q') {
      selection = false;
     numCharMoved ++;





      // Check if character has moved from initial position
      if (our_turn) {
        if (current_selection.getMoved()) {

          if (attack_selection) {
            
            
            
            for (int i = 0; i < character_array.length; i++) {
              if (!character_array[i].can_attack) {
                character_array[i].can_attack = true;
              }
              if (!character_array[i].can_move) {
                character_array[i].can_move = true;
              }
            }
            if (our_turn && numCharMoved == character_count) {
                    for (int i = 0; i < character_array.length; i++) {
                      character_array[i].setMoved(false);
                  }
                  our_turn = false;
                  numCharMoved=0;
                   
                }           
            
            attack_selection = false;
            
 
            
          } else {
            
            
            for (int i = 0; i < character_array.length; i++) {
              if (!character_array[i].can_attack) {
                character_array[i].can_attack = true;
              }

              if (!character_array[i].can_move) {
                character_array[i].can_move = true;
              }
            }
           if (our_turn && numCharMoved == character_count) {
                    for (int i = 0; i < character_array.length; i++) {
                      character_array[i].setMoved(false);
                  }
                  our_turn = false;
                  numCharMoved=0;
                   
                }
              
              
             
            
          }
          
        }
        
        current_selection.can_move = false;
      } else {
        if (current_selection.getMoved()) {
          if (attack_selection) {
            if (!our_turn && numCharMoved == enemy_count) {
                for (int i = 0; i < character_array.length; i++) {
                  character_array[i].setMoved(false);
              }
              
              our_turn = true;
              numCharMoved = 0;
              
      
            }             
            
            for (int i = 0; i < character_array.length; i++) {
              if (!character_array[i].can_attack) {
                character_array[i].can_attack = true;
              }

              if (!character_array[i].can_move) {
                character_array[i].can_move = true;
              }
            }
           
            
            
            attack_selection = false;

          } else {
            if (!our_turn && numCharMoved == enemy_count) {
                for (int i = 0; i < character_array.length; i++) {
                  character_array[i].setMoved(false);
              }
              
              our_turn = true;
              numCharMoved = 0;
              
      
            }            
            for (int i = 0; i < character_array.length; i++) {
              if (!character_array[i].can_attack) {
                character_array[i].can_attack = true;
              }

              if (!character_array[i].can_move) {
                character_array[i].can_move = true;
              }
            }
            
          }

          current_selection.can_move = false;

        }

      }
      if (!our_turn && numCharMoved == enemy_count) {
        
        
        our_turn = true;
        numCharMoved = 0;
      }
    
    }
    
  }

}
