//WIP //several bugs!!!


import processing.video.*;
Capture video;

PShader colorSh;
PShader displaceSh;
PGraphics map;
boolean doShader=true;
boolean showMask = false;

float ang=0.0;
void setup() {
  size(640, 480, P3D);
  noStroke();
  map = createGraphics(width, height, P3D);
  colorSh=loadShader("fragcolor.glsl", "vertcolor.glsl");
  displaceSh = loadShader("displace.glsl");

  video = new Capture(this, 640, 480);
  video.start();
}

void draw() {
  if (video.available()) {

    video.read();
  }
  map.beginDraw();
  map.noStroke();
  if (doShader) {
    map.shader(colorSh);
  }
  background(0);
  //lights();
  ang+=PI/400;


  for (int i=-1; i<2; i++) {
    for (int j=-1; j<2; j++) {
      map.pushMatrix();
      map.translate(width/2+i*160, height/2+j*160, 0);
      map.rotateX(ang*(i+2));
      map.rotateY(ang*(j+2));
      map.fill((i+3)*50, (j+3)*25, 100);
     
        map.box(100);
     
      
      map.popMatrix();
    }
  }
  map.endDraw();

  
  displaceSh.set("mask", map);
  if (showMask) {
    image(map, 0, 0);
  } else {
    shader(displaceSh);
    image(video, 0, 0);
  }
}


void keyPressed() {
  if (key=='d') {
    doShader=!doShader;
    if (!doShader) {
      map.resetShader();
      
    }
  } else if (key == 'm') {
    showMask = !showMask;
    if (showMask) {
      resetShader();
    }
  }
}