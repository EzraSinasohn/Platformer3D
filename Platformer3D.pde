ArrayList<Ground> ground = new ArrayList<Ground>();
float camX = 0, camY = 0, camZ = 100, camRX = 0, camRY = 0;
Player me = new Player(0, -25, 0, 10, 10, 20);
void setup() {
  size(800, 800, P3D);
  ground.add(new Ground(0, 0, 0, 25, 25, 25));
  lights();
  rectMode(CORNERS);
}

void draw() {
  background(100, 200, 250);
  for(int i = 0; i < ground.size(); i++) {
    ground.get(i).show();
  }
  me.move();
  me.show();
  me.boundingBox();
  moveCam();
  camera(me.x+camX, me.y+camY, me.z+camZ, me.x, me.y, me.z, 0, 1, 0);
  fill(0);
  text(camRY, 0, -80);
}

