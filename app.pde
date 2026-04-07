float sliderY;
float brushSize = 1;

color currentColor = #000000;

// Preset colors
color white = #ffffff;
color black = #000000;
color red = #ff0000;
color green = #00ff00;
color blue = #0000ff;
color brown = #300000;
color yellow = #fff300;
color purple = #4F266C;
color orange = #ff6f00;

// Hue slider variables
float hueX = 20;
float hueY = 260;
float hueW = 260;
float hueH = 30;

// Stamp system
boolean stampMode = false;
int stampType = 0; // 1 = smiley, 2 = heart, 3 = skull

void setup() {
  size(2000, 1000);
  sliderY = 40;
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  drawBrush();

  // Left toolbar background
  noStroke();
  fill(black);
  rect(0, 0, 300, height);

  // Brush size slider
  stroke(white);
  line(50, 40, 50, 240);
  circle(50, sliderY, 20);

  // Color buttons
  buttonCircle(100, 70, red);
  buttonCircle(170, 70, green);
  buttonCircle(240, 70, blue);

  buttonCircle(100, 140, white);
  buttonCircle(170, 140, black);
  buttonCircle(240, 140, brown);

  buttonCircle(100, 210, yellow);
  buttonCircle(170, 210, purple);
  buttonCircle(240, 210, orange);

  // Hue slider
  drawHueSlider();

  // Indicators
  drawBrushSizeIndicator();
  drawColorIndicator();

  // Stamp buttons
  drawStampButton(60, 460, 1); // smiley
  drawStampButton(140, 460, 2); // heart
  drawStampButton(220, 460, 3); // skull
}

void drawBrush() {
  fill(currentColor);
  stroke(0);
  strokeWeight(1);
  ellipse(50, height - 50, brushSize, brushSize);
}

void buttonCircle(int x, int y, color t) {
  fill(t);
  stroke(white);
  circle(x, y, 50);
}

void drawHueSlider() {
  noStroke();
  for (int i = 0; i < hueW; i++) {
    float h = map(i, 0, hueW, 0, 360);
    fill(h, 100, 100);
    rect(hueX + i, hueY, 1, hueH);
  }

  // Selector line
  stroke(255);
  strokeWeight(3);
  float handleX = map(hue(currentColor), 0, 360, hueX, hueX + hueW);
  line(handleX, hueY, handleX, hueY + hueH);
}

void drawColorIndicator() {
  fill(255);
  textSize(16);
  text("Selected Color", 55, 320);
  fill(currentColor);
  stroke(255);
  strokeWeight(2);
  rect(20, 330, 260, 40);
}

void drawBrushSizeIndicator(){
  fill(255);
  textSize(16);
  text("Brush Size", 40, 390);
  noStroke();
  fill(80);
  rect(20,400,260,20);
  float barWidth = map(brushSize*1.82, 1, 400, 1, 260);
  fill(200);
  rect(20, 400, barWidth, 20);
}

// STAMP BUTTONS + STAMP DRAWING


void drawStampButton(int x, int y, int type) {
  fill(255);
  stroke(0);
  circle(x, y, 50);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(22);

  if (type == 1) text("☺", x, y);
  if (type == 2) text("❤", x, y);
  if (type == 3) text("☠", x, y);
}

void placeStamp(float x, float y) {
  textAlign(CENTER, CENTER);
  textSize(brushSize * 2);

  if (stampType == 1) text("☺", x, y);
  if (stampType == 2) text("❤", x, y);
  if (stampType == 3) text("☠", x, y);
}

void mouseReleased() {
  // Color buttons
  if (dist(100, 70, mouseX, mouseY) < 50) { currentColor = red; stampMode = false; }
  if (dist(170, 70, mouseX, mouseY) < 50) { currentColor = green; stampMode = false; }
  if (dist(240, 70, mouseX, mouseY) < 50) { currentColor = blue; stampMode = false; }

  if (dist(100, 140, mouseX, mouseY) < 50) { currentColor = white; stampMode = false; }
  if (dist(170, 140, mouseX, mouseY) < 50) { currentColor = black; stampMode = false; }
  if (dist(240, 140, mouseX, mouseY) < 50) { currentColor = brown; stampMode = false; }

  if (dist(100, 210, mouseX, mouseY) < 50) { currentColor = yellow; stampMode = false; }
  if (dist(170, 210, mouseX, mouseY) < 50) { currentColor = purple; stampMode = false; }
  if (dist(240, 210, mouseX, mouseY) < 50) { currentColor = orange; stampMode = false; }

  // Stamp buttons
  if (dist(100, 420, mouseX, mouseY) < 25) { stampMode = true; stampType = 1; }
  if (dist(170, 420, mouseX, mouseY) < 25) { stampMode = true; stampType = 2; }
  if (dist(240, 420, mouseX, mouseY) < 25) { stampMode = true; stampType = 3; }
}

void mousePressed() {
  if (stampMode && mouseX > 300) {
    placeStamp(mouseX, mouseY);
  }
}

void mouseDragged() {
  // Brush size slider
  if (mouseY > 30 && mouseY < 250 && mouseX > 40 && mouseX < 60) {
    sliderY = mouseY;
    brushSize = sliderY - 30;
  }

  // Hue slider
  if (mouseY > hueY && mouseY < hueY + hueH &&
      mouseX > hueX && mouseX < hueX + hueW) {

    float h = map(mouseX, hueX, hueX + hueW, 0, 360);
    currentColor = color(h, 100, 100);
    stampMode = false;
  }

  // Drawing (only if NOT stamping)
  if (!stampMode && mouseX > 300) {
    strokeWeight(brushSize);
    stroke(currentColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
