int y= 0;
int radius=0;
int delta=5;

void setup() {
  size (500, 500);
  background (135,206,235);
  stroke(250);
} 

void draw() {
  background (135,206,235);
  
  fill(120,30);
  
  ellipse(width/2, height/2, radius,radius);
  radius+= delta;
  if(radius<0||radius>480) {
  delta*= -1;
  }
  
  line(70,y,width-70,y);
  line(70, y+40, width-70, y+40);
  y += 15;
  if(y>500) {
    y=0;
  }
}

void mousePressed() {
  loop();
}