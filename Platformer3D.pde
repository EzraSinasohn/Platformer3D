ArrayList<Ground> ground = new ArrayList<Ground>();
float camX = 0, camY = 0, camZ = 100, camRX = 0, camRY = 0, camVY = 0;
Player me = new Player(0, -25, 0, 10, 10, 20);
void setup() {
  size(800, 800, P3D);
  ground.add(new Ground(0, 0, 0, 25, 25, 25));
  ground.add(new Ground(0, 17.5, 0, 100, 100, 10));
  rectMode(CORNERS);
}

void draw() {
  background(100, 200, 250);
  for(int i = 0; i < ground.size(); i++) {
    ground.get(i).show();
  }
  me.move();
  me.jump = false;
  for(int i = 0; i < ground.size(); i++) {
    me.collision(ground.get(i));
  }
  moveCam();
  fill(0);
  text(camRY, 0, -80);
  text(me.sides(ground.get(0))[0], -100, 0, -20);
  text(me.sides(ground.get(0))[1], -20, 0, -20);
  text(me.sides(ground.get(0))[2], 60, 0, -20);
  text(me.sides(ground.get(0))[3], 140, 0, -20);
  text(me.sides(ground.get(0))[4], 220, 0, -20);
  text(me.sides(ground.get(0))[5], 300, 0, -20);
  pushMatrix();
    fill(255, 0, 0);
    translate(me.x, me.y, me.z);
    rotateY(-me.rotation);
    box(me.l, me.h, me.w);
    popMatrix();
}












