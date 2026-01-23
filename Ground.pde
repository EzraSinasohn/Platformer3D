class Ground {
  float x, y, z, l, w, h;
  public Ground(float xPos, float yPos, float zPos, float myLength, float myWidth, float myHeight) {
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
