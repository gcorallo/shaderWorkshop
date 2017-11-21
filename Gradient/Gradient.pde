PShader sh;

void setup(){
  size(800,450,P2D);
  sh = loadShader("sh.frag", "sh.vert");
  sh.set("resolution", (float)width,(float)height);

}

void draw(){
  
  sh.set("time", (float)millis());
  shader(sh);
  rect(0,0,width,height);
  
}