import controlP5.*;

ControlP5 cp5;

float bright, contrast;

void controlSet() {

  cp5 = new ControlP5(this);

  cp5.addSlider("bright")
    .setPosition(width-150, 50)
    .setRange(0.1, 4.0)
    .setValue(1.0)
    .setWidth(80)
    ;
    cp5.addSlider("contrast")
    .setPosition(width-150, 90)
    .setRange(0.1, 4.0)
    .setValue(1.0)
    .setWidth(80)
    ;
}