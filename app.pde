float slider;

float y;

float brushSize = 20;

color currentColor;

color white = #ffffff;

color black = #000000;

color red = #ff0000;

color green = #00ff00;

color blue = #0000ff;

color brown = #300000;

color yellow = #fff300;

color purple = #4F266C;

color orange = #ff6f00;

void setup(){
  size(2000,1000);
  y=40;
}

void draw(){
  if(mousePressed){
    noStroke();
    fill(currentColor);
    
  }
  background(white);
  
  noStroke();
  fill(black);
  rect(0,0,300,1000);
  
  stroke(white);
  line(50,40, 50, 440);
  circle(50,y,20);
  
  buttonCircle(100,70,red);
  buttonCircle(170,70,green);
  buttonCircle(240,70,blue);
  buttonCircle(100,140,white);
  buttonCircle(170,140,black);
  buttonCircle(240,140,brown);
  buttonCircle(100,210,yellow);
  buttonCircle(170,210,purple);
  buttonCircle(240,210,orange);
}

void drawBrush(){
  fill(currentColor);
  stroke(0);
  strokeWeight(1);
  ellipse(50,height-50,brushSize,brushSize);
}

void buttonRect(int x, int y, color t){
  fill(t);
  rect(x,y,50,50);
}

void buttonCircle(int x, int y, color t){
  fill(t);
  circle(x,y,50);
}

void select(int x, int y, int r){
   if(dist(x,y,mouseX,mouseY)<r){
     stroke(255);
  } 
   else{
     stroke(0);
   }
  
}

void mouseReleased(){
  if(dist(100,70,mouseX,mouseY)<50){
    currentColor = red;
  }
  
  if(dist(170,70,mouseX,mouseY)<50){
    currentColor = green;
  }
  
  if(dist(240,70,mouseX,mouseY)<50){
    currentColor = blue;
  }
    
  if(dist(100,140,mouseX,mouseY)<50){
    currentColor = white;
  }
    
  if(dist(170,140,mouseX,mouseY)<50){
    currentColor = black;
  }
  if(dist(240,140,mouseX,mouseY)<50){
    currentColor = brown;
  }
}

void mouseDragged(){
  if (mouseY > 30 && mouseY < 450 && mouseX > 40 && mouseX < 60) {
    y=mouseY;
  }
}
