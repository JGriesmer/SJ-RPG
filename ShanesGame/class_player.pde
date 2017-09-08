//Class\\
class player {

  PImage scene1;
  PImage scene2;
  int sceneTrans; //(0 = no, 1 = door1, 2 = door2
  int menu;

  private float xpos, ypos, xsize, ysize;
  int scene; //(Scene 1 = 1, Scene 2 = 2)


  public player( float y, float x) {
    ypos = y;
    xpos = x;
  }

  public void initialNum() {
    scene1 = loadImage("scene1.png");
    scene2 = loadImage("scene2.png");

    xsize = ysize;
    xsize = 75;
    ysize = 75;
    scene = 1;
    sceneTrans = 0;
  }

  public void update() {
    textSize(40);
    fill(#ffffff);
  }

  public void keyPressed() {
    if (key == CODED && menu == 0) { 
      if (keyCode == UP && keyPressed) {
        ypos = ypos +10;
      }
      if (keyCode == DOWN && keyPressed) {
        ypos = ypos - 10;
      }
      if (keyCode == RIGHT && keyPressed) {
        xpos = xpos - 10;
      }
      if (keyCode == LEFT && keyPressed) {
        xpos = xpos + 10;
      }
    }

    //Constraints
    if (xpos >= 910) {
      xpos = 910;
    }    
    if (xpos <= -910) {
      xpos = -910;
    }
    if (ypos >= 488) {
      ypos = 488;
    }
    if (ypos <= -488) {
      ypos = -488;
    }

    //Scene 1 to Scene 2 || DOOR 1
    if (scene == 1 && xpos <= 12 && xpos >= -48 && ypos >= -490 && ypos <=-460) {
      if (key == CODED) {
        if (keyCode == SHIFT) {
          scene = 2;
          sceneTrans = 1;
        }
      }
    }
    //Scene 2 to Scene 1 || DOOR 1
    if (scene ==2);
  }

  public void thebox() {


    //Scene 1
    if (scene == 1) {
      image(scene1, xpos, ypos);
      fill(21);
      rect(xpos+900, ypos+1055, 150, 25);
    }
    if (scene == 2) {
      if (sceneTrans == 1) {
        xpos = -10;
        ypos = 488;
        sceneTrans = 0;
      }
      image(scene2, xpos, ypos);
    }
  }

  // Import Menu Up
  public void setMenuUp(int menuUp) {
    menu = menuUp;
  }

  public void showXY() {
    // SHOW X AND Y
    textSize(50);
    textAlign(RIGHT);
    text("X: " + xpos + ", Y: " + ypos, 600, 100);
  }
}