//class for Terrain generation
class Terrain {
  
  //initialize variables
  private byte xPos;
  private byte yPos;
  private boolean block;
  private String type;
  private byte border;
  //types are "lake" for now
  
  
  //constructor
  Terrain(byte xPos, byte yPos, boolean block, String type, byte border) {
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
    rect((border * 50) * xPos, (border * 50) * yPos, 50, 50);
  }
}
