PShader sh;

void setup(){
  float f=1.;
  size( int(800*f),int(450*f),P2D);
  sh = loadShader("sh.frag", "sh.vert");
  
}

void draw(){
  shader(sh);
  sh.set("time", (float)millis());
  sh.set("resolution", (float)width, (float)height);
  rect(0,0,width,height);
  //saveFrame("sh.png");
  //exit();
}


