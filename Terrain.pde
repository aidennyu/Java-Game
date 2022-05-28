//class for Terrain generation
class Terrain {
  
  //initialize variables
  private int xPos;
  private int yPos;
  private boolean block;
  //add terrain ints here
  private int pond;
  private int test_mountain = 0;
  private int total = pond + test_mountain;
  
  //constructor
  Terrain(int xPos, int yPos, boolean block, int pond) {
   this.xPos = xPos;
   this.yPos = yPos;
   this.block = block;
   this.pond = pond;
  }
  
  //total amount of terrain blocks
  int total() {
     return total;
  }
  
  int getxPos() {
     return xPos; 
  }
  
  int getyPos() {
     return yPos; 
  }
  
  void display() {
    stroke(0);
    fill(204,255,229);
  }
  
  //setup gen
  int worldGeneration_A() {
     return coordinate;
  }
  
  //make an array list of coordinates for generation
}
