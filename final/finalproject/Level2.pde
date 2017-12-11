//setup
void levelTwoSetup(){
  pa.setCoordinates(width/20, height/15*11);
  pen.setCoordinates(width/2, height/2);
  pen.dx = pen.dy = 0;
  
  obstacles.clear();
  obstacles.add(new Thing(width/7*5, height/10*8, 50, 70)); //right bottom
  obstacles.add(new Thing(width/4*3, 0, 50, 240)); //right top
  obstacles.add(new Thing(width/9*6, height/7*5, 130, 10));  //right mid
  obstacles.add(new Thing(width/9, height/5*3, 180, 20));  //left bottom
  obstacles.add(new Thing(0, height/4, 40, height/3));  //left top
  obstacles.add(new Thing(width/12*5, height/8*5, 10, 130));  //mid
  obstacles.add(new Thing(width/12*4, height/6, 10, 140));   //mid top
  
  drawObstacles();
  image(Apple, app.xcor, app.ycor);
  image(Pen, pen.xcor, pen.ycor); 
  
}

void levelTwoDraw(){
   // the video is playing and it hasn't finished
   if (videoStart == false && levelWon == false) {
     // if there are still frames
     if (movie2.available()) {
       background(255, 255, 255);
       movie2.volume(0.4);
       movie2.read();
       image(movie2, 0, 0, width, height);
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
       text("Press Enter to continue",  200, 250, 600, 300);
     }
   }
   // level 2 has started, not yet won
   else if (levelWon == false){  
     background(Background);
     fill(#e27e0b, 200);
     rect(0, 0, 1000, 700);
     // Draw all the obstacles
     drawObstacles();
     image(Pineapple, pa.xcor, pa.ycor);
     image(Pen, pen.xcor, pen.ycor); 
     pen.move();
     checkBounds(pen);
     pa.move();
     checkBounds(pa);
     if (collides(pa, pen)) {
        if (videoStart == true) {
          sound2.stop();
          movie2.jump(0);
          movie2.play(); 
          videoStart = false;
        }
     }
   }
}