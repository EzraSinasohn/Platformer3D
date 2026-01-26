public boolean[] keys = new boolean[8];
public float rotation;
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
    fill(255, 0, 0);
    translate(x, y, z);
    rotateY(-rotation);
    box(l, h, w);
    translate(0, 0, w+1);
    popMatrix();
  }
  
  public void move() {
    if(keys[4]) {
      rotation = camRX;
      x += cos(camRX)*1;
      z += sin(camRX)*1;
    } if(keys[5]) {
      rotation = camRX;
      x -= cos(camRX)*1;
      z -= sin(camRX)*1;
    } if(keys[6]) {
      rotation = camRX;
      x += sin(camRX)*1;
      z -= cos(camRX)*1;
    } if(keys[7]) {
      rotation = camRX;
      x -= sin(camRX)*1;
      z += cos(camRX)*1;
    }
  }
  
  public void collision() {
    
  }
}

public void moveCam() {
  if(keys[0] && camRY < 1.5) {
    camRY += 0.1;
  } if(keys[1] && camRY > -1.5) {
    camRY -= 0.1;
  } if(keys[2]) {
    camRX += 0.1;
  } if(keys[3]) {
    camRX -= 0.1;
  }
  camX = cos(camRX)*cos(camRY)*100;
  camY = sin(camRY)*100;
  camZ = sin(camRX)*cos(camRY)*100;
  camera(me.x+camX, me.y+camY, me.z+camZ, me.x, me.y, me.z, 0, 1, 0);
}

public void keyPressed() {
  if(key == 'a') {
    keys[7] = true;
  } else if(key == 'd') {
    keys[6] = true;
  } else if(key == 'w') {
    keys[5] = true;
  } else if(key == 's') {
    keys[4] = true;
  } else if(keyCode == LEFT) {
    keys[3] = true;
  } else if(keyCode == RIGHT) {
    keys[2] = true;
  } else if(keyCode == UP) {
    keys[1] = true;
  } else if(keyCode == DOWN) {
    keys[0] = true;
  }
}

public void keyReleased() {
  if(key == 'a') {
    keys[7] = false;
  } else if(key == 'd') {
    keys[6] = false;
  } else if(key == 'w') {
    keys[5] = false;
  } else if(key == 's') {
    keys[4] = false;
  } else if(keyCode == LEFT) {
    keys[3] = false;
  } else if(keyCode == RIGHT) {
    keys[2] = false;
  } else if(keyCode == UP) {
    keys[1] = false;
  } else if(keyCode == DOWN) {
    keys[0] = false;
  }
}
