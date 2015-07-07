PShader boxColor;
boolean doShader=true;
float ang=0.0;
void setup(){
  size(800,600,P3D);
  noStroke();
  boxColor=loadShader("fragcolor.glsl","vertcolor.glsl");
}

void draw(){
  if(doShader){
  shader(boxColor);
  }
  background(0);
  //lights();
  ang+=PI/400;
  
  
  for(int i=-1;i<2;i++){
    for(int j=-1;j<2;j++){
    pushMatrix();
    translate(width/2+i*160,height/2+j*160,0);
    rotateX(ang*(i+2));
    rotateY(ang*(j+2));
    fill((i+3)*50, (j+3)*25,100);
    if((i+j)%2==0){
      //box(100,50,50);
      box(100);
    }
    else{
      sphere(50);
    }
    popMatrix();
    }
  }
  
}


void keyPressed(){
  if(key=='d'){
    doShader=!doShader;
    if(!doShader){
      resetShader();
    }
  }



}
