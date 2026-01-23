ArrayList<Ground> ground = new ArrayList<Ground>();
float camX = 0, camY = 0, camZ = 100, camRX = 0, camRY = 0;
Player me = new Player(100, -45, 100, 10, 20, 10);
void setup() {
  size(800, 800, P3D);
  ground.add(new Ground(0, 0, 0, 25, 25, 25));
}

void draw() {
  background(50);
  for(int i = 0; i < ground.size(); i++) {
    ground.get(i).show();
  }
  me.show();
  camera(me.x+camX, me.y+camY, me.z+camZ, me.x, me.y, me.z, 0, 1, 0);
}
