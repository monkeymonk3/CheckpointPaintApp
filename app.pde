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
color gray = #D8D8D8;

// Hue slider variables
float hueX = 20;
float hueY = 260;
float hueW = 260;
float hueH = 30;

// Stamp toggle system 
boolean[] stampOn = new boolean[5];

PImage nootnoot;
PImage frog;

PFont font;

// Button sizes
int btnW = 260;
int btnH = 40;

int saveY = 620;
int loadY = 670;
int clearY = 720;
int eraserY = 770;

void setup() {
  background(gray);
  size(2000, 1000);
  sliderY = 40;
  colorMode(HSB, 360, 100, 100);

  font = createFont("Segoe UI Symbol", 32);
  textFont(font);

  nootnoot = loadImage("nootnoot.jpg");
  frog = loadImage("frog.jpg");
}

void draw() {
  drawBrush();

  noStroke();
  fill(black);
  rect(0, 0, 300, height);

  stroke(white);
  line(50, 40, 50, 240);
  circle(50, sliderY, 20);

  buttonCircle(100, 70, red);
  buttonCircle(170, 70, green);
  buttonCircle(240, 70, blue);

  buttonCircle(100, 140, white);
  buttonCircle(170, 140, black);
  buttonCircle(240, 140, brown);

  buttonCircle(100, 210, yellow);
  buttonCircle(170, 210, purple);
  buttonCircle(240, 210, orange);

  drawHueSlider();
  drawBrushSizeIndicator();
  drawColorIndicator();

  drawEmojiStampToggle(60, 460, stampOn[0], "☺");
  drawEmojiStampToggle(140, 460, stampOn[1], "❤");
  drawEmojiStampToggle(220, 460, stampOn[2], "☠");

  drawImageStampToggle(60, 540, stampOn[3], nootnoot);
  drawImageStampToggle(160, 540, stampOn[4], frog);

  drawButton(20, saveY, btnW, btnH, "Save Canvas");
  drawButton(20, loadY, btnW, btnH, "Load Canvas");
  drawButton(20, clearY, btnW, btnH, "Clear Canvas");
  drawButton(20, eraserY, btnW, btnH, "Eraser");
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

void drawEmojiStampToggle(int x, int y, boolean active, String emoji) {
  if (active) fill(180);
  else fill(255);

  stroke(0);
  rect(x - 30, y - 30, 60, 60, 10);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(28);
  text(emoji, x, y);
}

void drawImageStampToggle(int x, int y, boolean active, PImage img) {
  if (active) fill(180);
  else fill(255);

  stroke(0);
  rect(x - 30, y - 30, 60, 60, 10);

  imageMode(CENTER);
  image(img, x, y, 40, 40);
}

void placeStamp(float x, float y) {
  float s = max(brushSize * 2, 10);

  textAlign(CENTER, CENTER);
  textFont(font);
  textSize(s);

  fill(currentColor);

  if (stampOn[0]) text("☺", x, y);
  if (stampOn[1]) text("❤", x, y);
  if (stampOn[2]) text("☠", x, y);

  if (stampOn[3]) image(nootnoot, x, y, s, s);
  if (stampOn[4]) image(frog, x, y, s, s);
}

void drawButton(int x, int y, int w, int h, String label) {
  fill(255);
  stroke(0);
  rect(x, y, w, h, 8);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(18);
  text(label, x + w/2, y + h/2);
}

void saveCanvas() {
  save("myCanvas.png");
}

void loadCanvas() {
  PImage loaded = loadImage("myCanvas.png");
  if (loaded != null) {
    image(loaded, 1000, 500);
  }
}

void clearCanvas() {
  fill(gray);
  noStroke();
  rect(300, 0, width - 300, height);
}

void mouseReleased() {

  if (dist(100, 70, mouseX, mouseY) < 25) currentColor = red;
  if (dist(170, 70, mouseX, mouseY) < 25) currentColor = green;
  if (dist(240, 70, mouseX, mouseY) < 25) currentColor = blue;

  if (dist(100, 140, mouseX, mouseY) < 25) currentColor = white;
  if (dist(170, 140, mouseX, mouseY) < 25) currentColor = black;
  if (dist(240, 140, mouseX, mouseY) < 25) currentColor = brown;

  if (dist(100, 210, mouseX, mouseY) < 25) currentColor = yellow;
  if (dist(170, 210, mouseX, mouseY) < 25) currentColor = purple;
  if (dist(240, 210, mouseX, mouseY) < 25) currentColor = orange;

  if (mouseX < 300) {
    for (int i = 0; i < 5; i++) stampOn[i] = false;
  }

  if (dist(60, 460, mouseX, mouseY) < 30) toggleStamp(0);
  if (dist(140, 460, mouseX, mouseY) < 30) toggleStamp(1);
  if (dist(220, 460, mouseX, mouseY) < 30) toggleStamp(2);

  if (dist(60, 540, mouseX, mouseY) < 30) toggleStamp(3);
  if (dist(160, 540, mouseX, mouseY) < 30) toggleStamp(4);

  if (mouseX > 20 && mouseX < 20 + btnW &&
      mouseY > saveY && mouseY < saveY + btnH) saveCanvas();

  if (mouseX > 20 && mouseX < 20 + btnW &&
      mouseY > loadY && mouseY < loadY + btnH) loadCanvas();

  if (mouseX > 20 && mouseX < 20 + btnW &&
      mouseY > clearY && mouseY < clearY + btnH) clearCanvas();
      
  if (mouseX > 20 && mouseX < + btnW&&
      mouseY > eraserY && mouseY < eraserY + btnH) currentColor = gray;
}

void toggleStamp(int index) {
  boolean newState = !stampOn[index];
  for (int i = 0; i < 5; i++) stampOn[i] = false;
  stampOn[index] = newState;
}

void mousePressed() {
  if (mouseX > 300) {
    for (int i = 0; i < 5; i++) {
      if (stampOn[i]) {
        placeStamp(mouseX, mouseY);
        return;
      }
    }
  }
}

void mouseDragged() {

  if (mouseY > 30 && mouseY < 250 && mouseX > 40 && mouseX < 60) {
    sliderY = mouseY;
    brushSize = sliderY - 30;
  }

  if (mouseY > hueY && mouseY < hueY + hueH &&
      mouseX > hueX && mouseX < hueX + hueW) {

    float h = map(mouseX, hueX, hueX + hueW, 0, 360);
    currentColor = color(h, 100, 100);

    for (int i = 0; i < 5; i++) stampOn[i] = false;
  }

  boolean stamping = false;
  for (int i = 0; i < 5; i++) if (stampOn[i]) stamping = true;

  if (!stamping && mouseX > 300) {
    strokeWeight(brushSize);
    stroke(currentColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
