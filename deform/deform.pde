PGraphics canvas;

PImage img;
PImage img2;
PShader sampler;

boolean doShader=true;
void setup() {
  size(400, 300, P2D);
  img = loadImage("patitos.jpg");
  sampler = loadShader("sampler.glsl");
  canvas = createGraphics(width, height, P2D);

  sampler.set("resolution", (float)width,(float)height);
 
}


void draw() {
  background(0);
  sampler.set("time", (float)millis());
  
 
  canvas.beginDraw(); 
  canvas.background(0);
  
  canvas.image(img,0,0);

  canvas.endDraw();
  if (doShader) {
    shader(sampler);
  }
  image(canvas, 0, 0);
}

void keyPressed() {
  if (key== 'd') {
    doShader=!doShader;
    if (!doShader) {
      resetShader();
    }
  }
}