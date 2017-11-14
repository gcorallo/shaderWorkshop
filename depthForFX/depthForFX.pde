
//depthmap from: http://forum.processing.org/two/discussion/2153/how-to-render-z-buffer-depth-pass-image-of-a-3d-scene

int nparts=500;
Part[] parts=new Part[nparts];

PShader effect;

PShader depthMap;
float xOff=0;
PGraphics pg;
PGraphics canvas;

PGraphics depth;

float passes=1;
float blAmmnt;
float ang=0.0;
float mode = 1;
float maxModes = 7;
//boolean debug =true;
int viewMode =0; 
String[] fxName ={"Displace","distort","rg displace","alpha","moise","more noise", "fog"};
void setup() {

  size(960, 540, P3D);


  effect=loadShader("effect.glsl");

  depthMap=loadShader("depth.glsl");
  pg=createGraphics(width, height, P3D);
  canvas=createGraphics(width, height, P2D);

  depth=createGraphics(width, height, P3D);
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();

  pg.endDraw();


  depthMap.set("near", 400.0);
  depthMap.set("far", 700.0); 
  depthMap.set("nearColor", 1.0, 1.0, 1.0, 1.0); 
  depthMap.set("farColor", 0.0, 0.0, 0.0, 1.0); 

  controlSet();

  for (int i=0; i<nparts; i++) {
    parts[i]=new Part();
    parts[i].pos=new PVector(random(-width/2, width/2), random(-width/2, width/2), random(-width/2, width/2));
    parts[i].r=random(100, 200);
    parts[i].g=random(10, 200);
    parts[i].b=random(120, 220);
  }


  noStroke();
}


void draw() {
  if (frameCount>1) {
    //noLoop();
  }
  ang+=PI/300;
  


  drawGeom(pg);
  drawGeom(depth);



  depthMap.set("near", nearV); 
  depthMap.set("far", farV); 
  depth.beginDraw();
  depth.shader(depthMap);
  depth.endDraw();



  effect.set("xOff", xOff);
  effect.set("mode", (float)mode);
  effect.set("time", (float)millis());
  effect.set("depthSampler", depth);



  canvas.beginDraw();
  canvas.shader(effect);
  canvas.image(pg, 0, 0);
  canvas.endDraw();



  if (viewMode==0) {
    image(pg, 0, 0, width/2, height/2);
    image(depth, 0, height/2, width/2, height/2);
    image(canvas, width/2, 0, width/2, height/2);
    fill(200);
    rect(width/2, height/2, width/2, height/2);
  } else if (viewMode==1) {
    image(depth, 0, 0, width, height);
  } else if (viewMode==2) {
    image(canvas, 0, 0, width, height);
  } else if (viewMode==3) {
    image(pg, 0, 0, width, height);
  }

  fill(255);
  text("q,w,e,r: change viewport.", 10,10);
  text("<- and -> keys change fx", 10,25);
  text(fxName[int(mode-1)], 10,50);  
  
  
}

void drawGeom(PGraphics temp) {
 
  float z=-250;
  temp.beginDraw();

  temp.stroke(0);
  temp.fill(255);
  temp.lights();

  temp.background(0);
  temp.noStroke();
  temp.translate(width/2, height/2, z);



  temp.rotateY(ang);
  temp.rotateX(PI/2);
  for (int i=0; i<nparts; i++) {
    temp.pushMatrix();
    temp.translate(parts[i].pos.x, parts[i].pos.y, parts[i].pos.z);
    temp.fill(parts[i].r, parts[i].g, parts[i].b);
    temp.box(20);
    temp.popMatrix();
  }

  temp.box(600, 100, 100);
  temp.endDraw();
  
 
}

void keyPressed() {
  if (key=='q') {
    viewMode = 0;
  } else if (key=='w') {
    viewMode = 1;
  } else if (key=='e') {
    viewMode = 2;
  } else if (key=='r') {
    viewMode = 3;
  }
  if(key==CODED){
    if(keyCode==RIGHT){
     
      if(mode<maxModes){
        mode++;
      }
      else{
        mode=1;
      }
    }
    else if(keyCode==LEFT){
      if(mode>1){
        mode--;
      }
      else{
        mode=maxModes;
      }  
    }
  
  }
  
}