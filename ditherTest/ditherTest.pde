/*

Ordered dithering aka Bayer matrix dithering 
from http://devlog-martinsh.blogspot.com.ar/2011/03/glsl-dithering.html
*/
PGraphics canvas;
PImage img;
PShader dither;

boolean doShader=true;
void setup() {
  size(800, 450, P2D);
  img = loadImage("patitos.jpg");
  dither = loadShader("dither.glsl");
  canvas = createGraphics(width, height, P2D);

 
}


void draw() {
  background(0);
  dither.set("time", (float)millis());
  dither.set("texture2",img);
  canvas.beginDraw(); 
  canvas.background(0);
  
  canvas.image(img,0,0);

  canvas.endDraw();
  if (doShader) {
    shader(dither);
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

