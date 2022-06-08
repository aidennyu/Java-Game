// I will blow up parliamnet
 class MenuList{
  private ArrayList<Menu> totalMenus = new ArrayList<Menu>();
    
  //add menu to array to be shown
  public void addMenu( Menu menu){
    totalMenus.add(menu);
  }
  
  //remove menu from array
  public void removeMenu( int index){
    totalMenus.remove(index);
  }
  
  public void drawMenus(){
    for (int i = 0; i < totalMenus.size(); i++){
      totalMenus.get(i).drawMenu();
    }
  } 
/* Mr. Zieloko's idea that doesn't work
  public Menu createMenu (String type, String message) 
  {
    Menu activeMenu;
    if (type.equalsIgnoreCase("textmenu")){
      activeMenu = new TextMenu("bruh",message,100,100,200,500,225);
  }
     return activeMenu;
  
  }
*/
}
