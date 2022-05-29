//class for Terrain generation
class Terrain {
  
  //initialize variables
  private int xPos;
  private int yPos;
  private boolean block;
  private String type;
  private int border;
  //types are "lake" for now
  
  
  //constructor
  Terrain(int xPos, int yPos, boolean block, String type, int border) {
   this.xPos = xPos;
   this.yPos = yPos;
   this.block = block;
   this.type = type;
   this.border = border;
  }
  
  void display() {
    stroke(0);
    fill(204,255,229);
    
    //border * box_size makes it so the pond is now on the grid.
    //the -1 beside POS is to make the grid coordinates start at 1, not 0 to make worlds easier (nvm i removed it)
    rect((border * 50) + (50 * xPos), (border * 50) + (50 * yPos), 50, 50);
  }
  
  void coordinate_Test() {
    println("pond at " + xPos + ", " + yPos);
  }
}
