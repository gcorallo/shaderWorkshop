import processing.video.*;
Capture video;
PGraphics canvas;
PShader process;

 

void setup(){
   size(840, 480, P2D);
   video = new Capture(this, 640, 480);
   video.start();  
   
   controlSet();
   canvas =createGraphics(640,480,P2D);
   process=loadShader("process.glsl");
}


void draw(){
  background(0);
  if (video.available()) {
    
    video.read();
  }
  
  process.set("bright", bright);
  process.set("contrast", contrast);
  
  canvas.beginDraw();
  canvas.image(video, 0, 0);
  canvas.shader(process);
  canvas.endDraw();
 
  image(canvas, 0,0);
  


}