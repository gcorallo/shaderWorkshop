PShader sh;

void setup(){
  size(800,450,P2D);
  sh = loadShader("sh.frag", "sh.vert");
  
}

void draw(){
  shader(sh);
  sh.set("time", (float)millis());
  sh.set("resolution", float(width),float(height));
  rect(0,0,width,height);
  
}


