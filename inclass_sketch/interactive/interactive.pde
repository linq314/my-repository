//image follow mouse
void setup() {
  size(600,600);
}

void draw (){
  background(0)
 ;
 
 //fill (mouseX*255/width);
 //fill (mouseX*255/height);
 
 ellipse(mouseX, mouseY, 100,100);
}
 
 
 
 
 
 //follow keyboard
 void keyPressed() {
   
   println(key);
   
   if (key == 'f') {
     fill(255,0,0);
   }
   if (key == 'd') {
     fill(100,100,0);
   }
 }
 
 
 
 
 
 
 
 //follow mouse
 boolean something = true; 

//change when press
if (mousePressed== true) {
  drection = -1;
}

else if (mousePressed == false) {
  diresction = 1;
}

void mousePressed(){
  direction= direction*-1;
}