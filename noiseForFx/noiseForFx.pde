PShader sh;
int W = 800;
int H = 800;
float maxModes = 7;
float mode = 1.0;
PGraphics pg;
String[] fxName ={"terrain", "sinusoidal", "rgb sin", "divided", "divided II", "radial", "water"};
String[] val1Name ={"hsv offset", "frequencie", "Redfreq", "Red comp", "-", "freq", "-"};
String[] val2Name ={"black lines frequencie", "amplitude", "Greenfreq", "Green comp", "-", "b offset", "b offset"};
String[] val3Name ={"-", "contrast", "Bluefreq", "Blue comp", "-", "contrast", "contrast"};

void setup() {

  size(1000, 800, P2D);
  sh = loadShader("sh.frag", "sh.vert");

  pg = createGraphics(1000, 800, P2D);
  controlSet();
  noStroke();
  sh.set("resolution", (float)W, (float)H);
}


void draw() {

  sh.set("time", (float)millis());
  sh.set("val1", val1);
  sh.set("val2", val2);
  sh.set("val3", val3);
  sh.set("subD", subD);
  sh.set("mode", mode);

  pg.beginDraw();
  pg.shader(sh);
  pg.rect(0, 0, W, H);
  pg.endDraw();

  image(pg, 0, 0);
  fill(0, 150);
  rect(5, 5, 200, 150);
  fill(255);
  text("<- and -> keys change fx", 10, 25);
  text("fx: "+fxName[int(mode-1)], 10, 50);
  text("val1: "+val1Name[int(mode-1)], 10, 75);
  text("val2: "+val2Name[int(mode-1)], 10, 100);
  text("val3: "+val3Name[int(mode-1)], 10, 125);
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==RIGHT) {

      if (mode<maxModes) {
        mode++;
      } else {
        mode=1;
      }
    } else if (keyCode==LEFT) {
      if (mode>1) {
        mode--;
      } else {
        mode=maxModes;
      }
    }
  }
}