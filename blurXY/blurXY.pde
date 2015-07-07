PShader blurH;
PShader blurV;
float xOff=2.0;
PGraphics pg;
PGraphics ping;
PGraphics pong;
int passes=1;
float ang=0.0;

int WW=600;
int HH=600;
void setup() {

  size(WW+200, HH, P3D);

  blurH=loadShader("blurH.glsl");
  blurV=loadShader("blurV.glsl");


  pg=createGraphics(WW, HH, P3D);
  ping=createGraphics(WW, HH, P3D);
  pong=createGraphics(WW, HH, P3D);
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();

  pg.endDraw();
  
  controlSet();
  
}


void draw() {
  ang+=PI/300;
  
  pg.beginDraw();
  pg.lights();
  pg.background(0);
  pg.noStroke();
  //pg.stroke(0);
  pg.translate(pg.width/2, pg.height/2);
  pg.rotateY(ang);
  pg.rotateX(ang);
  pg.box(200, 50, 100);
  pg.endDraw();

  blurH.set("xOff", mult+random(-1,1)*noise);
  blurV.set("xOff", mult+random(-1,1)*noise);


  pong.beginDraw();
  pong.image(pg, 0, 0);
  pong.endDraw();

  for (int i=0; i<passes; i++) {
    ping.beginDraw();
    ping.shader(blurH);
    ping.image(pong, 0, 0);
    ping.endDraw();

    pong.beginDraw();
    pong.shader(blurV);
    pong.image(ping, 0, 0);
    pong.endDraw();
  }

  image(pong, 0, 0);

  //println(frameRate);
  
  frame.setTitle(str(frameRate));
}
