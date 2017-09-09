//Class\\
class player {

  PImage scene1;
  PImage scene2;
  //
  //Scene Transition Doors (1 usually 1st door)
  int sceneTrans; //(0 = no, 1 = door1, 2 = door2
  //Menu up or down
  int menu;
  //
  //Scene Transition Buffers
  int s, sTrans, yesTrans; // (YesTrans: 0 = NO, 1 = YES)
  //
  //Sprite Attempt
  int SP1, SP2, SP3, SP4; //Movement Indicator (1 = Left, 2 = No, 3 = Right, 4 = No)
  int dir; // Direction Indicator (1 = Up, 2 = Down, 3 = Left, 4 = Right)
  int SPstill;
  int newMov;
  //Movement Floats
  private float xpos, ypos, xsize, ysize;
  //
  //Scene Visual
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
    yesTrans = 1;
    sTrans = -65;
  }

  public void sprite() {
    //fill(120);
    //ellipse( 940, 490, 35, 55);
    // ellipse( 980, 490, 35, 55);
    fill(51);
    rect(910, 490, 100, 100);
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

    /////////////////////////////////////////////////////////////////////////////////////////////
    //Scene 1 to Scene 2 || DOOR 1
    if (scene == 1 && xpos <= 12 && xpos >= -48 && ypos >= -490 && ypos <=-460 && yesTrans == 1) {
      if (key == CODED) {
        if (keyCode == SHIFT && keyPressed) {
          scene = 2;
          sceneTrans = 1;
          yesTrans = 0;
          if (s  >= 58) {
            sTrans = s -56;
          } else {
            sTrans = s + 2;
          }
        }
      }
    }
    //END Scene 1 to Scene 2 || DOOR 1
    //Scene 2 to Scene 1 || DOOR 1
    if (scene == 2 && xpos <= 12 && xpos >= -48 && ypos <= 490 && ypos >= 460 && yesTrans == 1) {
      if (key == CODED) {
        if (keyCode == SHIFT && keyPressed) {
          scene = 1;
          sceneTrans = 1;
          yesTrans = 0;
          if (s  >= 58) {
            sTrans = s -56;
          } else {
            sTrans = s + 2;
          }
        }
      }
    }

    /////////////////////////////////////////////////////////////////////////////////////////////
  } // END KEYPRESSED


  public void thebox() {

    //Second
    s = second();
    if (s == sTrans) {
      yesTrans = 1;
    }


    //Scene 1
    if (scene == 1) {
      if (sceneTrans == 1 && scene == 1) {
        xpos = -10;
        ypos = -488;
        sceneTrans = 0;
      }
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
    text("Scene: " + scene, 1600, 1000);
    text("Sec: " + s, 200, 800);
    text("Sec2: " + sTrans, 300, 900);
    text("yesTrans: " + yesTrans, 300, 1000);
    text("Josef Smells Bad", 700,700);
  }
}