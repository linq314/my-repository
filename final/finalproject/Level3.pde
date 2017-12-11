//setup
void levelThreeSetup(){
  pguy.setCoordinates(width/20*4, height/15);
  pen.setCoordinates(width/2, height/2);
  //pen.resize(10,25);
  pen.dx = pen.dy = 0;
  
  obstacles.clear();
  obstacles.add(new Thing(width/14*2, height/9*2, 20, 180)); //left mid
  obstacles.add(new Thing(width/14*3.5, height/10*8, 200, 50)); //left bottom
  obstacles.add(new Thing(width/14*5, height/10, 100, 30)); //top mid
  obstacles.add(new Thing(width/14*6.5, height/10*4.5, 100, 20)); //mid top
  //obstacles.add(new Thing(width/14*7, height/10*6, 100, 20)); //mid bottom  
  obstacles.add(new Thing(width/14*6, height/10*4.7, 20, 100)); //mid left
  //obstacles.add(new Thing(width/14*8.5, height/10*5.6, 70, 20)); //mid right
  obstacles.add(new Thing(width/14*12, height/9*.5, 30, 200)); //right top
  obstacles.add(new Thing(width/14*10, height/9*5, 80, height/9*2)); //right bottom
  
  drawObstacles();
  image(Apple, app.xcor, app.ycor);
  image(Pen, pen.xcor, pen.ycor); 
}

void levelThreeDraw(){
   // the video is playing and it hasn't finished
   if (videoStart == false && levelWon == false) {
     // if there are still frames
     if (movie3.available()) {
       background(255, 255, 255);
       movie3.volume(0.4);
       movie3.read();
       image(movie3, 0, 0, width, height);
     }
     // video is done, proceed
     else {
       levelWon = true; 
       videoStart = true;
       noStroke();
       fill(255,255,255,200);
       rect(0, 0, width, height);
       fill(#FF640C);
       textSize(25);
       textAlign(CENTER);
       text("Press Enter to restart", 200, 250, 600, 300);
       levelStart = true;
     }
   }
   // level 3 has started, not yet won
   else if (levelWon == false){  
     background(Background);
     fill(#f2ee24, 200);
     rect(0, 0, 1000, 700);
     // Draw all the obstacles
     drawObstacles();
     image(Ppapguy, pguy.xcor, pguy.ycor);
     image(Pen, pen.xcor, pen.ycor); 
     pen.move();
     checkBounds(pen);
     pguy.move();
     checkBounds(pguy);
     if (collides(pguy, pen)) {
        if (videoStart == true) {
          sound3.stop();
          movie3.jump(0);
          movie3.play(); 
          videoStart = false;
        }
     }
   }
}