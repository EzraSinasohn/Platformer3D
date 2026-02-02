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
    translate(x, y, 0);
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
    if(!(keys[6] || keys[7])) {vxs *= 0.9;}
    if(!(keys[4] || keys[5])) {vxc *= 0.9;}
    if(!(keys[4] || keys[5])) {vzs *= 0.9;}
    if(!(keys[6] || keys[7])) {vzc *= 0.9;}
  }
  
  public float[][][] boundingBox() {
    float[][] u = {{x+l/2, y-h/2, z+w/2}, {x-l/2, y-h/2, z+w/2}, {x+l/2, y-h/2, z-w/2}, {x-l/2, y-h/2, z-w/2}};
    float[][] d = {{x+l/2, y+h/2, z+w/2}, {x-l/2, y+h/2, z+w/2}, {x+l/2, y+h/2, z-w/2}, {x-l/2, y+h/2, z-w/2}};
    float[][] lt = {{x+l/2, y+h/2, z+w/2}, {x-l/2, y+h/2, z+w/2}, {x+l/2, y-h/2, z+w/2}, {x-l/2, y-h/2, z+w/2}};
    float[][] rt = {{x+l/2, y+h/2, z-w/2}, {x-l/2, y+h/2, z-w/2}, {x+l/2, y-h/2, z-w/2}, {x-l/2, y-h/2, z-w/2}};
    float[][] f = {{x+l/2, y+h/2, z+w/2}, {x+l/2, y+h/2, z-w/2}, {x+l/2, y-h/2, z+w/2}, {x+l/2, y-h/2, z-w/2}};
    float[][] b = {{x-l/2, y+h/2, z+w/2}, {x-l/2, y+h/2, z-w/2}, {x-l/2, y-h/2, z+w/2}, {x-l/2, y-h/2, z-w/2}};
    float[][][] box = {u, d, lt, rt, f, b};
    fill(0, 255, 0, 50);
    pushMatrix();
    translate(0, box[0][0][1], 0);
    rotateX(PI/2);
    rect(box[0][0][0], box[0][0][2], box[0][3][0], box[0][3][2]);
    popMatrix();
    pushMatrix();
    translate(0, box[1][0][1], 0);
    rotateX(PI/2);
    rect(box[1][0][0], box[1][0][2], box[1][3][0], box[1][3][2]);
    popMatrix();
    pushMatrix();
    translate(0, 0, box[2][0][2]);
    rect(box[2][0][0], box[2][0][1], box[2][3][0], box[2][3][1]);
    popMatrix();
    pushMatrix();
    translate(0, 0, box[3][0][2]);
    rect(box[3][0][0], box[3][0][1], box[3][3][0], box[3][3][1]);
    popMatrix();
    pushMatrix();
    translate(box[4][0][0], 0, 0);
    rotateZ(PI/2);
    rotateX(PI/2);
    rect(box[5][0][1], box[5][0][2], box[5][3][1], box[5][3][2]);
    popMatrix();
    pushMatrix();
    translate(box[5][0][0], 0, 0);
    rotateZ(PI/2);
    rotateX(PI/2);
    rect(box[5][0][1], box[5][0][2], box[5][3][1], box[5][3][2]);
    popMatrix();
    return box;
  }
  
  public void collision(Ground obj) {
    text(sides(obj)[0], -100, 0, -20);
    text(sides(obj)[1], -20, 0, -20);
    text(sides(obj)[2], 60, 0, -20);
    text(sides(obj)[3], 140, 0, -20);
    text(sides(obj)[4], 220, 0, -20);
    text(sides(obj)[5], 300, 0, -20);
  }
  
  /*public void footCollision(Ground obj) {
    boolean corner = false;
    if(((down()[0][0] < obj.up()[0][0] && down()[3][0] < obj.up()[3][0]+l/2 && down()[0][2] < obj.up()[0][2] && down()[3][2] < obj.up()[3][2]+w/2))) {
      
    }
  }*/
  
  public float[] sides(Ground obj) {
    float[] dim = {y-h/2-(obj.y+obj.h/2), -y+h/2+(obj.y-obj.h/2), x-l/2-(obj.x+obj.l/2), -x+l/2+(obj.x-obj.l/2), z-w/2-(obj.z+obj.w/2), -z+w/2+(obj.z-obj.w/2)};
    return dim;
  }
  
  public float[][] up() {return boundingBox()[0];}
  public float[][] down() {return boundingBox()[1];}
  public float[][] left() {return boundingBox()[2];}
  public float[][] right() {return boundingBox()[3];}
  public float[][] front() {return boundingBox()[4];}
  public float[][] back() {return boundingBox()[5];}
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

