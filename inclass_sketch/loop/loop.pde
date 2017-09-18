int startX = 100;
int startY = 50;
int endX = 300;
int endY = 100;

int spacing = 10;

int numberDrawn = 0;
int totalLines = 30;


void setup() {
size (500, 500);
background (100,100,00);
stroke (255);
}

////draw repeadly
//void draw() {
//  line( startX, startY + spacing, endX, endY+ spacing);
//  spacing += 10;
//}

//stop loop
//for (initial state; conditional; iterator) {
  for (int i = 0; i< 10; i+=1) {
    
    print(i+ " --");
  }
//drawing with end
void draw() {
  //background(100,100,0);
  //if(startY+ spacing , height) {
  ////if (numberDrawn < totalLines) {
  //  line( startX, startY + spacing, endX, endY+ spacing);
  //  spacing += 10;
  //  println("done drawing") ;     
  
  //} else {

  //spacing = 0;
  //numberDrawn = 0;
  //}
}
//