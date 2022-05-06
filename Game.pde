
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
  size(1000, 1000);
  columns = width/boxScale;
  rows = height/boxScale;
  
  //color, health, maxhealth, defense, attack, ammo, XPos, YPos
  myChar = new Character(color(255, 0, 0), 30, 30, 100, 100, 100, charX, charY);
  enemy1 = new Enemy(color(0, 255, 0), 30, 30, 100, 100, enemyX, enemyY);
  
  characterArray = new CharacterObject[count];

  for (int x = 0; x < count; x++) {
    characterArray[x] = new CharacterObject((x + 1) * 10, 100, (x + 1) * 50);
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
  myChar.display();
  enemy1.display();

  for (int x = 0; x < count; x++) {
    characterArray[x].display();
  }
  
  myChar.attack(enemy1);
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
  if (key == CODED) {
    if (keyCode == UP && (charY > border)) {

      myChar.setYPos(charY -= 1);
      //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
    } else if (keyCode == DOWN && (charY < rows - (border+1))) {

      myChar.setYPos(charY += 1);
      //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
    } else if (keyCode == RIGHT && (charX < columns - (border+1))) {

      myChar.setXPos(charX += 1);
      //println(myChar.getXPos() + " " + myChar.getYPos() + " ");
    } else if (keyCode == LEFT && (charX > border )) {

      myChar.setXPos(charX -= 1);
      // println(myChar.getXPos() + " " + myChar.getYPos() + " ");
    }
    //the println comments are for coordinate prints for testing
  }
}
