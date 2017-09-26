PImage tree1, tree2, tree3 ;
//boolean showimage = true;

float[] treex1= new float[20];
float[] treey1= new float[20];

float[] treex2= new float[30];
float[] treey2= new float[30];

float[] treex3= new float[20];
float[] treey3= new float[20];


//gradient
//int Y_AXIS = 1;
//color b1,b2;


void setup(){
  size(1000,700);
 
//random tree setup
  for(int i = 0; i<20; i++){
      treex1[i]=random(-50,900);
      treey1[i]=random(220,470);
      treex2[i]=random(-50,900);
      treey2[i]=random(230,470);
      treex3[i]=random(-50,900);
      treey3[i]=random(220,470);
  }

//insert tree 
  tree1=loadImage("smalltree.png");
  tree2=loadImage("bigtree.png");
  tree3=loadImage("skinnytree.png");
  
////define ground color
//b1= color(210,180,140);
//b2 = color(165, 121, 64);
}


void draw() {
  background(240,248,255);

  noStroke();
  //setGradient(0,500, width, 500, b1, b2, Y_AXIS);
  fill(205, 171, 126);
  rect(0,530,width,530);
 
 for(int i = 0; i<20; i++){
 //  if (mouseX > treex1[i] && mouseX < treex1[i] + 100) {
 //    ellipse(0,0,100,100);
 //  }
 //  if (mouseY > treey1[i] && mouseY < treey1[i] + 100) {
 //    ellipse(0,0,100,100);  
 //  }
 //}
   
   image(tree1,treex1[i],treey1[i],120,250);
   image(tree2,treex2[i],treey2[i],250,250);
   image(tree3,treex3[i],treey3[i],100,250);
  }
  }