size(500,500);

//background(240,248,255);
background(135,206,235);

//darkbrown
fill(139,69,19);
noStroke();

//left ear
ellipse(170,100,80,80);

//right ear
ellipse(330,100,80,80);

//right arm
rotate(-PI/3.6);
ellipse(0,410,40,60);

//left arm
rotate(PI/1.8);
ellipse(width/1.56,26,40,60);

//head
rotate(-PI/3.6);
ellipse(width/2,height/3,200,200);

//left leg
ellipse(210,340,50,40);

//right leg
ellipse(290,340,50,40);

//body
rect(205,230,90,110);

//light brown
fill(255,248,220);

ellipse(width/2,300,40,50);
ellipse(170,100,25,25);
ellipse(330,100,25,25);

//black
fill(0,0,0);

//left eye
ellipse(200,150,15,20);

//right eye
ellipse(300,150,15,20);

stroke(8);
//nose
ellipse(width/2,170,25,15);
line(width/2,177,width/2,185);
line(width/2,185,width/2-20,200);
line(width/2,185,width/2+20,200);