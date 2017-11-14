PShader sh;

void setup(){
  size(800,450,P2D);
  sh = loadShader("sh.frag", "sh.vert");
    
}

void draw(){
  shader(sh);
  
  rect(0,0,width,height);
 
}