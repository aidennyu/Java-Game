interface Menu{
  public void drawMenu;
}


class TextMenu implements Menu{
  private String title = "";
  private String text = "";
  private int xPos = 0;
  private int yPos = 0;
  private int boxHeight;
  private int boxWidth;
  
  TextMenu(String title, String text, int xPos, int yPos, int boxHeight, int boxWidth){
    this.title = title;
    this.text = text;
    this.xPos = xPos;
    this.yPos = yPos;
    this.boxHeight = boxHeight;
    this.boxWidth = boxWidth;
  }
  
  void drawMenu(){
    rect(xPos,yPos,boxWidth,boxHeight);
    text(text,xPos,yPos);  
  }
  
}
