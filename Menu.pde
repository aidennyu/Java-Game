interface Menu{
  //drawing menu
  public void drawMenu();
  //NOT USED - delete menu
  public void deleteMenu();
}


//making a box
class Box implements Menu{
  private int xPos = 0;
  private int yPos = 0;
  private int boxHeight;
  private int boxWidth;
  private int boxColor;
  
  Box (int xPos, int yPos, int boxHeight, int boxWidth, int boxColor){
    this.xPos = xPos;
    this.yPos = yPos;
    this.boxHeight = boxHeight;
    this.boxWidth = boxWidth;
    this.boxColor = color(boxColor,0,0);
  }
  
  void drawMenu(){
    fill(boxColor);
    rect(xPos,yPos,boxWidth,boxHeight);
  }
  
  void deleteMenu(){
  }
}


//making text menu
class TextMenu implements Menu{
  private String title = "";
  private String text = "";
  private int xPos = 0;
  private int yPos = 0;
  private int boxHeight;
  private int boxWidth;
  private color boxColor;
  
  TextMenu(String title, String text, int xPos, int yPos, int boxHeight, int boxWidth, int bruh){
    this.title = title;
    this.text = text;
    this.xPos = xPos;
    this.yPos = yPos;
    this.boxHeight = boxHeight;
    this.boxWidth = boxWidth;
    boxColor = color(bruh,0,0);
  }
  
  void drawMenu(){
    fill(boxColor);
    rect(xPos,yPos,boxWidth,boxHeight);
    fill(0);
    noStroke();
    text(text,xPos,yPos,boxWidth, boxHeight);  

  }
  
  void deleteMenu(){
  }
  
}
