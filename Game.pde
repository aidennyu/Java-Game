<<<<<<< Updated upstream
//Patch v1.1:
//Character Class is implemented
//movement is implemented for test object myChar
//fixed red ball not moving
//please dont delete the comments on grid_game cuz they're notes
//we can put the cursor into its own class later with mutator methods like the myChar.
//fixed red dot border
//added Q as selection button with boolean

  
  

  //initializes classes
  Character myChar;
  Character currentSelection;
  Character oldSelection;
  Character Char2;
  //Coordinates for CURSOR
  int border = 3;
  int xCursorCord = border; 
  int yCursorCord = border;
  //Coordinates for Character class object
  int charX = border;
  int charY = border;
  boolean Selection;

  //Size of the box on the grid
  int boxScale = 50;

  //Number of columns and rows
  int columns, rows;
=======

boolean newSelection = false;
boolean oldSelection = false;

//initializes classes
Character myChar;
Enemy enemy1;

//initializes character array
CharacterObject[] characterArray;
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



>>>>>>> Stashed changes

void setup() {
  size(1000,1000);
  columns = width/boxScale;
  rows = height/boxScale;
<<<<<<< Updated upstream
  myChar = new Character(color(255,0,0), 100, 100, 100, 100, 100, 100, charX, charY);
  Char2 = new Character(color(0,0,255), 100, 100, 100, 100, 100, 100, 5, 5);
  currentSelection = null;
  Selection = false;
  
=======
  myChar = new Character(color(255, 0, 0), 100, 100, 100, 100, 100, 100, charX, charY);
  enemy1 = new Enemy(color(0, 255, 0), 100, 100, 100, enemyX, enemyY);
  characterArray = new CharacterObject[count];
  currentSelection = null;
  Selection = false;
  for (int x = 0; x < count; x++) {
    characterArray[x] = new CharacterObject((x + 1), 1, (x + 1));
  }
>>>>>>> Stashed changes
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
      fill(255,0,0,100);
      stroke(00);
      rect(xCursorCord*50, yCursorCord*50, boxScale, boxScale);
  
      //Draws Character object's thing
      myChar.display();
      Char2.display();
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
  
  //CURSOR MOVEMENT HERE:
  if (key == CODED) {
    if (keyCode == UP && (yCursorCord > border)) {
      yCursorCord -= 1;

    } else if (keyCode == DOWN && (yCursorCord < rows - (border+1))) {
       yCursorCord += 1;

    } else if (keyCode == RIGHT && (xCursorCord < columns - (border+1))) {
       xCursorCord += 1;

    } else if (keyCode == LEFT && (xCursorCord > border )) {
       xCursorCord -= 1;
    }
  }

  //CHARACTER MOVEMENT HERE:
<<<<<<< Updated upstream
  
  
  
=======
>>>>>>> Stashed changes
  if (Selection == true) {
    if (key == CODED) {
      if (keyCode == UP && (currentSelection.getYPos() > border)) {
       currentSelection.setYPos(-1);
  
      } else if (keyCode == DOWN && (currentSelection.getYPos() < rows - (border+1))) {
         currentSelection.setYPos(1);
  
      } else if (keyCode == RIGHT && (currentSelection.getXPos() < columns - (border+1))) {
         currentSelection.setXPos(1);
  
      } else if (keyCode == LEFT && (currentSelection.getXPos() > border )) {
         currentSelection.setXPos(-1);
      }
    }
  }
  
  
  
  
  
<<<<<<< Updated upstream
  if ((yCursorCord == Char2.getYPos()) && (xCursorCord == Char2.getXPos()) ){ 
    if (((key == 'Q') || (key == 'q'))) {
        currentSelection = Char2;
=======
  if ((yCursorCord == myChar.getYPos()) && (xCursorCord == myChar.getXPos()) ){ 
    if (((key == 'Q') || (key == 'q'))) {
        currentSelection = myChar;
>>>>>>> Stashed changes
        Selection = true; 
        //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
      }
  }
  
  
    if ((yCursorCord == myChar.getYPos()) && (xCursorCord == myChar.getXPos()) ){ 
      if (((key == 'Q') || (key == 'q'))) {
          currentSelection = myChar;
          Selection = true; 
          //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
        }
    }
  
    if (((key == 'R') || (key == 'r'))) {
 
        Selection = false;
        //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
      }
}
