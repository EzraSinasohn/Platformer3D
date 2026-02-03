ArrayList<Ground> ground = new ArrayList<Ground>();
float camX = 0, camY = 0, camZ = 100, camRX = 0, camRY = 0;
Player me = new Player(0, -25, 0, 10, 10, 20);
void setup() {
  size(800, 800, P3D);
  ground.add(new Ground(0, 0, 0, 25, 25, 25));
  rectMode(CORNERS);
}

void draw() {
  background(100, 200, 250);
  for(int i = 0; i < ground.size(); i++) {
    ground.get(i).show();
  }
  me.move();
  me.show();
  for(int i = 0; i < ground.size(); i++) {
    me.collision(ground.get(i));
  }
  moveCam();
  fill(0);
  text(camRY, 0, -80);
  me.collision(ground.get(0));
  fill(255);
  box(50, 50, 50);
  fill(255, 0, 0);
  pushMatrix();
  translate(me.x, me.y, me.z);
  rotateY(-me.rotation);
  box(me.l, me.h, me.w);
  popMatrix();
}










