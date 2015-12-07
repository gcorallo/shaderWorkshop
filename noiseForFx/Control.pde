import controlP5.*;

ControlP5 cp5;

float val1,val2,val3,subD;

void controlSet() {

  cp5 = new ControlP5(this);

  cp5.addSlider("val1")
    .setPosition(820, 100)
    .setRange(0., 1.0)
    .setValue(.5)
    .setWidth(80);

  cp5.addSlider("val2")
    .setPosition(820, 140)
    .setRange(0, 1)
    .setValue(.5)
    .setWidth(80);
  
  cp5.addSlider("val3")
    .setPosition(820, 180)
    .setRange(0, 1)
    .setValue(.5)
    .setWidth(80);    
 
  cp5.addSlider("subD")
    .setPosition(820, 220)
    .setRange(0,1)
    .setValue(10)
    .setWidth(80);
    
    
}