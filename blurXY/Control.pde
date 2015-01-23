import controlP5.*;

ControlP5 cp5;
boolean doble,invert;
float mult,noise;

Range range;
void controlSet() {

  cp5 = new ControlP5(this);

  cp5.addSlider("mult")
    .setPosition(width-150, 50)
      .setRange(0, 20)
        .setValue(1)
          .setWidth(80)
            ;
  cp5.addSlider("passes")
    .setPosition(width-150, 70)
      .setRange(0, 100)
        .setValue(2)
          .setWidth(80)
            ;
            
   cp5.addSlider("noise")
    .setPosition(width-150, 90)
      .setRange(0, 1)
        .setValue(0)
          .setWidth(80)
            ;          


     
  
}
