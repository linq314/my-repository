size(300,500);
background(0,200,255);

int joe = 255;
int sally = 100; 

int starburstPoint = 300;

// draw a line
//  red green blue transparency
stroke(255,255,00,200);
//   x1  y1  x2   y2
line(10, 10, 100, 100);
line(10, 100, 100, 10);
line(joe+100,joe,sally+50,starburstPoint);


//draw a rectangle
fill(100,0,255,150);
stroke(100,0,255,150);
//  x y width height
rect(250,20,30,400);

//draw a ellipse
fill(200,200,0,230);
stroke(255,255,00,200);
// center x y ,radius x y
ellipse(width/3,350,250,250);

//draw a triangle
noFill();
//       x1, y1, x2, y2, x3, y3
triangle(50, 150, 158, 100, 186, 175);