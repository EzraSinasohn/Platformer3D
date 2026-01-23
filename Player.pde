class Player {
  float x, y, z, l, w, h;
  public Player(float xPos, float yPos, float zPos, float myLength, float myWidth, float myHeight) {
    x = xPos;
    y = yPos;
    z = zPos;
    l = myLength;
    w = myWidth;
    h = myHeight;
  }
  
  public void show() {
    pushMatrix();
    translate(x, y, z);
    box(l, w, h);
    popMatrix();
  }
}

public void keyPressed() {
  if(keyCode == LEFT) {
    camRX -= 1;
  } else if(keyCode == RIGHT) {
    camRX += 1;
  } else if(keyCode == UP && camRY > -3) {
    camRY -= 1;
  } else if(keyCode == DOWN && camRY < 3) {
    camRY += 1;
  }
  camX = cos(camRX)*cos(camRY)*100;
  camY = sin(camRY)*100;
  camZ = sin(camRX)*cos(camRY)*100;
}
