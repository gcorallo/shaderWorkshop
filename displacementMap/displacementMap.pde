PGraphics mask;
PGraphics canvas;
PImage target;
PShader displace;
void setup() {

  size(800, 600, P2D);
  background(0, 0, 50);
  target = loadImage("patitos.jpg");


  mask = createGraphics(target.width, target.height, P2D);
  canvas = createGraphics(target.width, target.height, P2D);

  regen();
  
  displace = loadShader("displace.glsl");
}



void draw() {
  background(0, 0, 50);

  image(target, 0, 0);
  image(mask, 0, 300);

  canvas.beginDraw();
  canvas.image(target, 0, 0);
  displace.set("mask", mask);
  canvas.shader(displace);
  canvas.endDraw();

  image(canvas, 400, 0);
}

void regen() {
  mask.beginDraw();
  mask.background(255);
  mask.noStroke();
  for (int i=0; i<100; i++) {
    mask.fill(random(0, 100));
    mask.rect(random(0, mask.width), random(0, mask.height), 
    random(1, 10), random(100, 250));
  }
  mask.endDraw();
}

void keyPressed(){
  if(key == 'r'){
    regen();
  }
}

