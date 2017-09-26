int ellipseXoffsets[] = {0, 10,20,-10,-20};
  
 void setup(){
   size(600,600);
 }
 
 
void draw() {
  background(0);
  
  
  //ellipse(mouseX + ellipseXoffsets{0], mouseY, 10, 10);
  //ellipse(mouseX + ellipseXoffsets{1], mouseY, 10, 10);
  //ellipse(mouseX + ellipseXoffsets{2], mouseY, 10, 10);
  //ellipse(mouseX + ellipseXoffsets{3], mouseY, 10, 10);
  //ellipse(mouseX + ellipseXoffsets{4], mouseY, 10, 10);
  
  for (int i = 0; i<5; i+=1) {
  ellipse(mouseX + ellipseXoffsets[i], mouseY, 10, 10);
  }
}