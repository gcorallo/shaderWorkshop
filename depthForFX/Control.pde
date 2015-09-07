import controlP5.*;

ControlP5 cp5;

float nearV, farV, foco;

void controlSet() {

  cp5 = new ControlP5(this);

  cp5.addSlider("nearV")
    .setPosition(600, 400)
      .setRange(-2000, 2000)
        .setValue(150)
          .setWidth(80)
            ;
  cp5.addSlider("farV")
    .setPosition(600, 440)
      .setRange(-2000, 2000)
        .setValue(700)
          .setWidth(80)
            ;

 
  cp5.addSlider("xOff")
    .setPosition(600, 520)
      .setRange(0,100)
        .setValue(100)
          .setWidth(80);
 /*           ;              
  cp5.addSlider("passes")
    .setPosition(600, 480)
      .setRange(1, 20)
        .setValue(1)
          .setWidth(80)
            ;
            
  */
}
