//setup
void levelThreeSetup(){
  pguy.setCoordinates(width/20, height/15);
  pen.setCoordinates(width/2, height/2);
  pen.dx = pen.dy = 0;
  
  obstacles.clear();
  obstacles.add(new Thing(width/4, height/3*2, 300, 100));
  obstacles.add(new Thing(0, height/3*2, 300, height/3));
  obstacles.add(new Thing(width/3*2, 0, 100, 400));
}

void levelThreeDraw(){
   // the video is playing and it hasn't finished
   if (videoStart == false && levelWon == false) {
     // if there are still frames
     if (movie3.available()) {
       background(255, 255, 255);
       movie3.read();
       image(movie3, 0, 0, width, height);
     }
     // video is done, proceed
     else {
       levelWon = true; 
     }
   }
   // level 3 has started, not yet won
   else if (levelWon == false){  
     background(255,248,205);
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
           movie3.play(); 
           videoStart = false;
        }
     }
   }
}