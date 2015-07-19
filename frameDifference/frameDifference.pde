import processing.video.*;
Capture video;

PGraphics canvas;
PGraphics previo;
PShader diff;
int ww=320;
int hh=240;
void setup() {
  size(ww*2, hh*2, P2D);
  //frameRate(1); //con esto se chequea facil q el previo sea el previo.
  video = new Capture(this, ww, hh);
  video.start();  
  canvas = createGraphics(ww, hh, P2D);
  previo = createGraphics(ww, hh, P2D);

  diff = loadShader("diff.glsl");

  background(0);
}


void draw() {
  background(0);
  if (video.available()) {
    video.read();

    canvas.beginDraw();
    canvas.image(video, 0, 0);
    diff.set("previo", previo);
    canvas.shader(diff);
    canvas.endDraw();
  }

  image(video, 0, 0);
  image(previo, ww, 00);
  image(canvas, 00, hh);

  previo.beginDraw();
  previo.image(video, 0, 0);
  previo.endDraw();
}



