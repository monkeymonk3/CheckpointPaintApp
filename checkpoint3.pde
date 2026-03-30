float y;

void setup() {
  size(800,800);
  strokeWeight(3);
  y=400;
}

void draw(){
  background(255,0,0);
  line(400,200, 400, 600);
  circle(400,y,50);
}

void mouseDragged(){
  if (mouseY > 200 && mouseY < 600 && mouseX > 375 && mouseX < 425) {
    y=mouseY;
  }
}
