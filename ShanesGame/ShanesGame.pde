//Author\\
//Shane Koven\\

PImage startButton;
PImage startButtonH;
boolean start;
player B;
menu M;
controls C;


void settings() {
  size(1920, 1080);
  start = true;
}

void setup() {

  B = new player(0, 0);
  M = new menu();
  C = new controls();
  B.initialNum();
  M.load();
  startButton = loadImage("startbutton.png");
  startButtonH = loadImage("startbuttonH.png");
}
void draw() {
  background(90);


  B.update();
  B.thebox();
  B.keyPressed();
  //Player Icon
  //Player
  fill(51);
  noStroke();

  //Menu Page
  if ( start == false) { // Not during start menu
    M.keyPressed();
    M.menuPG();
  }
  //
  // Import Menu Up 
  B.setMenuUp(M.getMenuUp());
  //
  //PLAYER SPRITE
  B.sprite();
  //START PAGE
  if (start == true) {
    fill(#e6e6e6);
    rect(0, 0, 1920, 1080);
    if (mouseX >= 718 && mouseX <= 1203 && mouseY >= 816 && mouseY <= 935) {
      image(startButtonH, 0, 0, 1920, 1080);
    } else {
      image(startButton, 0, 0, 1920, 1080);
    }
    textAlign(CENTER);
    fill(51);
    if (mouseX >= 718 && mouseX <= 1203 && mousePressed && mouseY >= 816 && mouseY <= 935) {
      start = false;
    }
  }
  B.showXY();
}