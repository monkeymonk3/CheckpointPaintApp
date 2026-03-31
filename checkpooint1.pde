color red = #FF0000;

color green = #00FF00;

color blue = #0000FF;

color selectedColor; 

void setup(){
  size(600,600);
  
  selectedColor = red;
}
void draw(){
  background(122,26,80);
  
  fill(255,0,0);
  
  circle(150,500,50);
  
  fill(0,255,0);
  
  circle(300,500,50);
  
  fill(0,0,255);
  
  circle(450, 500,50);
  
  fill(selectedColor);
  
  rect(100,100,400,300);
  
}
void mouseReleased(){
  if(dist(150,500,mouseX,mouseY)<50){
    selectedColor = red;
  }
  
  if(dist(300,500,mouseX,mouseY)<50){
    selectedColor = green;
  }
  
  if(dist(450,500,mouseX,mouseY)<50){
    selectedColor = blue;
  }
}
