//setup
void levelOneSetup(){
  noStroke();
  fill(#e27e0b);
  rect(0, 0, width, height);
  
  app.setCoordinates(width/20, height/15);
  pen.setCoordinates(width/2, height/2);
  pen.dx = pen.dy = 0;
  
  obstacles.clear();
  obstacles.add(new Thing(width/8, 0, 40, 230)); //left top
  obstacles.add(new Thing(0, height/9*8, 500, height/9));  //left bottom
  obstacles.add(new Thing(width/3*2, 0, 60, 140));  //top
  obstacles.add(new Thing(width/4*3, 300, 70, 130)); //right mid
  obstacles.add(new Thing(width/2, 400, 150, 20)); //mid
  obstacles.add(new Thing(width/4, 200, 90, 10)); //left mid 2

  noStroke();
  fill(255,255,255,200);
  rect(0, 0, width, height);
  fill(#FF640C);
  textSize(50);
  textAlign(CENTER);
  text("Catch it!", 200, 150, 600, 300);
  textSize(25);
  text(" Press Enter to start \nUse arrows to move", 200, 250, 600, 300);
  
drawObstacles();
  image(Apple, app.xcor, app.ycor);
  image(Pen, pen.xcor, pen.ycor); 
}

void drawObstacles() {
  fill(#473e06);
  noStroke();
  for (int i = 0; i < obstacles.size(); i++) {
    rect(obstacles.get(i).xcor, obstacles.get(i).ycor, obstacles.get(i).w, obstacles.get(i).h);
  } 
}

void levelOneDraw(){
   
  // the video is playing and it hasn't finished
   if (videoStart == false && levelWon == false) {
     // if there are still frames
     if (movie1.available()) {
       background(255, 255, 255);
       movie1.volume(0.4);
       movie1.read();
       image(movie1, 0, 0, width, height);
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
       text("Press Enter to continue", 200, 250, 600, 300);
     }
   }
   // level 1 has started, not yet won
   else if (levelWon == false){   
     background(Background);
     fill(#b73410, 200);
     rect(0, 0, 1000, 700);
     // Draw all the obstacles
     drawObstacles();
     image(Apple, app.xcor, app.ycor);
     image(Pen, pen.xcor, pen.ycor); 
     pen.move();
     checkBounds(pen);
     app.move();
     checkBounds(app);
     if (collides(app, pen)) {
        if (videoStart == true) {
          sound1.stop();
          movie1.jump(0);
          movie1.play();
          videoStart = false;
       }
     }
 }
}