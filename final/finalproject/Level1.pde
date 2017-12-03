//setup
void levelOneSetup(){
  app.setCoordinates(width/20, height/15);
  pen.setCoordinates(width/2, height/2);
  pen.dx = pen.dy = 0;
  
  obstacles.clear();
  obstacles.add(new Thing(width/5, height/3, 50, 100));
  obstacles.add(new Thing(0, height/3*2, 300, height/3));
  obstacles.add(new Thing(width/3*2, 0, 100, 400));
}

void drawObstacles() {
  fill(233, 120, 234);
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
       movie1.read();
       image(movie1, 0, 0, width, height);
     }
     // video is done, proceed
     else {
       levelWon = true; 
     }
   }
   // level 1 has started, not yet won
   else if (levelWon == false){  
     background(255,248,205);
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
           movie1.play(); 
           videoStart = false;
        }
     }
   }
}