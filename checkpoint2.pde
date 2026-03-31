color red = #ff0000;

color green = #00ff00;

color blue = #0000ff;

color white = #ffffff;

color selectedColor;

void setup(){
  size(600,600);
  
  selectedColor = white;
}

void draw(){
  background(144,56,90);
  select(150,150,50);
  button(150,150,red);
  select(300,150,50);
  button(300,150,green);
  select(450,150,50);
  button(450,150,blue);
  display(300,300,200,200);

}

void display(int x, int y, int w, int h){
  fill(selectedColor);
  rect(x,y,w,h);
}

void button(int x, int y, color t){
  fill(t);
  rect(x,y,50,50);
}

void mouseReleased(){
  if(mouseX>150 && mouseX<200 && mouseY>150 && mouseY<200){
    selectedColor = red;
  }
  if(mouseX>300 && mouseX<350 && mouseY>150 && mouseY<200){
    selectedColor = green;
  }
  if(mouseX>450 && mouseX<500 && mouseY>150 && mouseY<200){
    selectedColor = blue;
  }
}

void select(int x, int y, int r){
   if(mouseX>x && mouseX<x+r && mouseY>y && mouseY<y+r){
     stroke(225);
  } 
   else{
     stroke(0);
   }
  
}
