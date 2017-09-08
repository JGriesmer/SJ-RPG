//Class
class menu {

int menuUp; // 0 = Not up, 1 = up
PImage popup;

  public void load() {
    popup = loadImage("popup.png");
    menuUp = 0;
  }


  public void keyPressed() {
    if (keyPressed) {
      if (key == ENTER && menuUp == 0) {
        menuUp = 1;
      }
      if (key == BACKSPACE && menuUp == 1) {
        menuUp = 0;
      }
    }
  }
  public void menuPG() {
    if (menuUp == 1) {
      fill(41);
      image(popup, 0, 0, 1920, 1080);
    }
  }
  
public int getMenuUp(){
  return menuUp;
}

}