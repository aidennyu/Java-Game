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

int enemyX = (int)(random(3, rows));
int enemyY = (int)(random(3, rows));

//size of window
int windowSize = 500;

void setup() {
  size(1000,1000);
  columns = width/boxScale;
  rows = height/boxScale;
  myChar = new Character(color(255,0,0), 100, 100, 100, 100, 100, 100, charX, charY);
  Char2 = new Character(color(0,0,255), 100, 100, 100, 100, 100, 100, 5, 5);
  currentSelection = null;
  Selection = false;
  
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
  
  
  
  
  
  if ((yCursorCord == Char2.getYPos()) && (xCursorCord == Char2.getXPos()) ){ 
    if (((key == 'Q') || (key == 'q'))) {
        currentSelection = Char2;
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
