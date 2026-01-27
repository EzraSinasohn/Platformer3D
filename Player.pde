public boolean[] keys = new boolean[8];
class Player {
  float x, y, z, l, w, h, rotation, vx, vy, vz, vxs, vxc, vzs, vzc;
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
      rotation = camRX+PI;
      vxc = cos(camRX)*1;
      vzs = sin(camRX)*1;
    } if(keys[5]) {
      rotation = camRX;
      vxc = -cos(camRX)*1;
      vzs = -sin(camRX)*1;
    } if(keys[6]) {
      rotation = camRX+PI/2;
      vxs = sin(camRX)*1;
      vzc = -cos(camRX)*1;
    } if(keys[7]) {
      rotation = camRX-PI/2;
      vxs = -sin(camRX)*1;
      vzc = cos(camRX)*1;
    }
    vx = vxs + vxc;
    vz = vzs + vzc;
    x += vx;
    z += vz;
    if(!moveKeys()) {
      vxs *= 0.9;
      vxc *= 0.9;
      vzs *= 0.9;
      vzc *= 0.9;
    }
  }
  
  public void boundingBox() {
    fill(0, 255, 0);
    pushMatrix();
    translate(x, y, z);
    rotateY(-rotation);
    translate(-l/2, -h/2, -w/2);
    rect(0, 0, l, h);
    popMatrix();
    pushMatrix();
    noStroke();
    translate(x-l*cos(rotation)/2, y-h/2, z-w*sin(rotation)/2);
    sphere(1);
    stroke(0);
    popMatrix();
  }
  
  public void collision() {
    for(int i = 0; i < ground.size(); i++) {
      
    }
  }
}

public void moveCam() {
  if(keys[0] && camRY < 1.5) {
    camRY += 0.05;
  } if(keys[1] && camRY > -1.5) {
    camRY -= 0.05;
  } if(keys[2]) {
    camRX += 0.05;
  } if(keys[3]) {
    camRX -= 0.05;
  }
  camX = cos(camRX)*cos(camRY)*100;
  camY = sin(camRY)*100;
  camZ = sin(camRX)*cos(camRY)*100;
  camera(me.x+camX, me.y+camY, me.z+camZ, me.x, me.y, me.z, 0, 1, 0);
}

public void keyPressed() {
  if(key == 'a') {
    keys[7] = true;
  } if(key == 'd') {
    keys[6] = true;
  } if(key == 'w') {
    keys[5] = true;
  } if(key == 's') {
    keys[4] = true;
  } if(keyCode == LEFT) {
    keys[3] = true;
  } if(keyCode == RIGHT) {
    keys[2] = true;
  } if(keyCode == UP) {
    keys[1] = true;
  } if(keyCode == DOWN) {
    keys[0] = true;
  }
}

public void keyReleased() {
  if(key == 'a') {
    keys[7] = false;
  } if(key == 'd') {
    keys[6] = false;
  } if(key == 'w') {
    keys[5] = false;
  } if(key == 's') {
    keys[4] = false;
  } if(keyCode == LEFT) {
    keys[3] = false;
  } if(keyCode == RIGHT) {
    keys[2] = false;
  } if(keyCode == UP) {
    keys[1] = false;
  } if(keyCode == DOWN) {
    keys[0] = false;
  }
}

public boolean moveKeys() {return keys[4] || keys[5] || keys[6] || keys[7];}
