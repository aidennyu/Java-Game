<<<<<<< Updated upstream
=======
// Global variables
Character[] character_array;

int character_count = 3;
int enemy_count = 5;
int total_count = character_count += enemy_count;
>>>>>>> Stashed changes

boolean newSelection = false;
boolean oldSelection = false;

//initializes classes
Character myChar;
Enemy enemy1;

//initializes character array
Character[] characterArray;
Character[] enemyArray;
int count = 4;

//Coordinates for CURSOR
int border = 3;
int xCursorCord = border;
int yCursorCord = border;

//Number of columns and rows
int columns, rows;

//Size of the box on the grid
int boxScale = 50;

//Coordinates for Character class object
int charX = border;
int charY = border;

int enemyX = (int)(random(border, border + 14));
int enemyY = (int)(random(border, border + 14));

//size of window
int windowSize = 500;
//Thomas vars
boolean Selection;
Character currentSelection;




void setup() {
  size(1000, 1000);
<<<<<<< Updated upstream
  columns = width/boxScale;
  rows = height/boxScale;
  
  enemy1 = new Enemy(color(0, 255, 0), 100, 100, 100, enemyX, enemyY);
  characterArray = new Character[count];
  enemyArray = new Character[count];
  currentSelection = null;
  Selection = false;
  for (int x = 0; x < count; x++) {
    characterArray[x] = new Character(color(255, 0, 0), 100, 100, 100, 100, 100, 100, charX * (x + 1), charY * (x + 1));
    
  }
  for (int x = 0; x < count; x++) {
    enemyArray[x] = new Character(color(157, 0, 255), 100, 100, 100, 100, 100, 100, charX * (x + 1) +1, charY * (x + 1)+1);
    
=======
  columns = width / box_size;
  rows = height / box_size;
  character_array = new Character[total_count];
  current_selection = null;
  
  for (int i = 0; i < total_count; i++) {
     if (i < enemy_count){
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));
    character_array[i] = new Character(100, border + character_x, border + character_y, 100, 100, false);




    }else{
    character_x = int(random(columns - 2 * border));
    character_y = int(random(columns - 2 * border));
    character_array[i] = new Character(100, border + character_x, border + character_y, 100, 100, true);
    

    
    }
>>>>>>> Stashed changes
  }
}
void draw() {
  background(255);
  for (int i = border; i < columns - border; i++) {
    for (int p = border; p < rows - border; p++) {

      int xCord = i * boxScale;
      int yCord = p * boxScale;

      //Colours of inside the box and the outline
      fill(255);
      stroke(0);

      //generates box (xlocation, ylocation, width, length)
      rect(xCord, yCord, boxScale, boxScale);
    }
  }
  //Draws Cursor
  fill(255, 0, 0, 100);
  stroke(00);
  rect(xCursorCord*50, yCursorCord*50, boxScale, boxScale);

  //Draws Character object's thing

  enemy1.display();

  for (int x = 0; x < count; x++) {
    characterArray[x].display();
  }
  for (int x = 0; x < count; x++) {
    enemyArray[x].display();
  }
}

boolean overlap() {
  boolean same_space = false;
  
    for (int x = 0; x < count; x++) {
      for(int y =0; y < count; y++){
        if(x != y && characterArray[x].getYPos() == characterArray[y].getYPos() && characterArray[x].getXPos() == characterArray[y].getXPos() ){
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

void keyPressed() {

  /* Uses Arrow Keys:
   UP = yCursorCord -1
   LEFT = xCursorCord - 1
   DOWN = yCursorCord + 1
   RIGHT = xCursorCord - 1
   
   Coordinates Start At UPLEFT CORNER
   Coordinates Start At 0,0 (with border it is +border but the restrictions move with the increase or decrease of the border so its technically still 0,0)
   */

  boolean char_moved = true;

  

  //CHARACTER MOVEMENT HERE:
  if (Selection && key == CODED) {
   
      if (keyCode == UP && (currentSelection.getYPos() > border)) {
       currentSelection.setYPos(-1);
       if (overlap()) {
        currentSelection.setYPos(+1);  
        char_moved = false;
      }
  
      } else if (keyCode == DOWN && (currentSelection.getYPos() < rows - (border+1))) {
         currentSelection.setYPos(1);
         if (overlap()) {
        currentSelection.setYPos(-1);  
        char_moved = false;
      }
  
      } else if (keyCode == RIGHT && (currentSelection.getXPos() < columns - (border+1))) {
         currentSelection.setXPos(1);
        if (overlap()) {
        currentSelection.setXPos(-1); 
        char_moved = false;
      }
      } else if (keyCode == LEFT && (currentSelection.getXPos() > border )) {
         currentSelection.setXPos(-1);
         if (overlap()) {
        currentSelection.setXPos(1);  
        char_moved = false;
      }
      }
    
  }
  
  //CURSOR MOVEMENT HERE:
  if (key == CODED) {
    if (keyCode == UP && (yCursorCord > border)) {
      yCursorCord -= 1;
      
      
      if (!char_moved) {
        yCursorCord += 1;  
        
      }
    } else if (keyCode == DOWN && (yCursorCord < rows - (border+1))) {
      yCursorCord += 1;
      
      if (!char_moved) {
        yCursorCord -= 1;  
        
      }
    } else if (keyCode == RIGHT && (xCursorCord < columns - (border+1))) {
      xCursorCord += 1;
      if (!char_moved) {
        xCursorCord -= 1;  
        
      }
    } else if (keyCode == LEFT && (xCursorCord > border )) {
      xCursorCord -= 1;
      if (!char_moved) {
        xCursorCord += 1; 
        
      }
    }
  }
  
  
  for (int x = 0; x < count; x++) {
    
  
  if ((yCursorCord == characterArray[x].getYPos()) && (xCursorCord == characterArray[x].getXPos()) ){ 
    if (((key == 'Q') || (key == 'q'))) {
        currentSelection = characterArray[x];
        Selection = true; 
        //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
        break;
      }
  }
  }
   for (int x = 0; x < count; x++) {
    
  
  if ((yCursorCord == enemyArray[x].getYPos()) && (xCursorCord == enemyArray[x].getXPos()) ){ 
    if (((key == 'Q') || (key == 'q'))) {
        currentSelection = enemyArray[x];
        Selection = true; 
        //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
        break;
      }
  }
  }
  
  
  
    if (((key == 'R') || (key == 'r'))) {
 
        Selection = false;
        //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
      }
}
