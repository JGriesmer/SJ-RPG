class controls {

  PImage control;
  int xpos, ypos;
  int location; // 1 = down, 2 = up
  int mov; // 0 = None, 1 = Up, 2 = Down

  public void update() {
    xpos = 0;
    ypos = 495;
    location = 1;
    mov = 0;
    control = loadImage("controls.png");
  }

  public void control() {
    image(control, xpos, ypos);
    text("x: " +xpos + " y: " +ypos + " loc: " + location, 500, 300);
    if ( xpos == 0 && ypos == 495) {
      location = 1;
    }
    if (xpos == 0 && ypos <= 0) {
      location = 2;
    } 
    if (xpos == 0 && ypos <= 494 && ypos >= 1) {
      location = 0;
    }

    if (location == 1 && mousePressed && mouseX >= 1430 && mouseX <= 1630 && mouseY >= 1050 && mouseY <= 1080) {
      mov = 1;
    }
    if (location == 2 && mousePressed && mouseX >= 1430 && mouseX <= 1630 && mouseY >= 555 && mouseY <= 585) {
      mov = 2;
    }

    if (mov == 1 && ypos >= 0) {
      ypos = ypos -10;
    }
   if (mov == 2 && ypos <= 495) {
     ypos = ypos +10;
   }
  }
}

//495