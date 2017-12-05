import processing.video.*;

import processing.sound.*;

PImage Pineapple, Pen, Apple, Ppapguy; 
Movie movie1;
Movie movie2;
Movie movie3;
SoundFile sound1;
SoundFile sound2;
SoundFile sound3;

MovingThing pa, pen, app,pguy; 
ArrayList<Thing> obstacles;

Boolean levelStart = true;
Boolean levelWon = false;
Boolean videoStart = true;
Boolean soundStart = true;
int level;

void setup(){
  size(1000, 700);
  
  // initialize objects
  Pineapple = loadImage("Pineapple.png");
  Pen = loadImage("pen.png");
  Apple = loadImage("apple.png");
  Ppapguy = loadImage("ppapguy.png");
  movie1 = new Movie(this, "applepen.mp4");
  movie2 = new Movie(this, "pineapplepen.mp4");
  movie3 = new Movie(this, "ppap.mp4");
  sound1 = new SoundFile(this, "applepen.mp3");
  sound2 = new SoundFile(this, "pineapplepen.mp3");
  sound3 = new SoundFile(this, "ppap.mp3");
  
  
  pa = new MovingThing(20, 40, 8);
  pen = new MovingThing(30, 50, 3); 
  app = new MovingThing(40, 40, 5);
  pguy = new MovingThing(30, 40, 5);
  Pineapple.resize(pa.w, pa.h);
  Pen.resize(pen.w, pen.h);
  Apple.resize(app.w, app.h);
  Ppapguy.resize(pguy.w, pguy.h);
  
  level = 1;
  obstacles = new ArrayList<Thing>();
  
  // setup level 1
  levelOneSetup();
  drawObstacles();
  image(Apple, app.xcor, app.ycor);
  image(Pen, pen.xcor, pen.ycor); 
  noStroke();
  fill(255,255,255,200);
  rect(0, 0, width, height);
  fill(#FF640C);
  textSize(50);
  textAlign(CENTER);
  text("Press Enter to start \nUse arrows to move", 200, 100, 600, 300);
}

void draw(){
  if (level == 1 && levelStart == false) {
    levelOneDraw();
  }
  else if (level == 2) {
    levelTwoDraw();
  }
  else if (level == 3)  { 
    levelThreeDraw();
  }
}

void keyReleased() {
  if (keyCode == UP) {
     pen.dy = 0;
   }
   
   if (keyCode == DOWN) {
     pen.dy = 0;
   }
   
   if (keyCode == LEFT) {
     pen.dx = 0;
   }
   
   if (keyCode == RIGHT) {
     pen.dx = 0;
   }
}

void keyPressed(){
  // Change the velocity of the pen when key pressed
   if (keyCode == UP) {
     pen.dy = -1 * pen.speed;
   }
   
   if (keyCode == DOWN) {
     pen.dy = pen.speed;
   }
   
   if (keyCode == LEFT) {
     pen.dx = -1 * pen.speed;
   }
   
   if (keyCode == RIGHT) {
     pen.dx = pen.speed;
   }
    // start and restart level
    if (key == RETURN || key == ENTER) {
      if (level == 1 && levelStart == true) {
        sound1.play();
        sound1.loop();
        levelStart = false;
      }
      if (level == 1 && levelWon == true) {
        levelTwoSetup();    
        level += 1;
        sound2.loop();
        levelWon = false;
      }
      if (level == 2 && levelWon == true) {
        levelThreeSetup();
        level += 1;
        sound3.loop();
        levelWon = false;
      }
      if (level == 3 && levelWon == true) {
        levelOneSetup();
         level = 1;
         levelWon = false;
         levelStart = true;
      }
    }
}

void checkBounds(MovingThing thing){
     if (thing.dx > 0 && thing.xcor + thing.w >= width) {
       thing.dx *= -1;
       thing.xcor = width - thing.w; 
     }
     else if (thing.dx < 0 && thing.xcor <= 0) {
       thing.dx *= -1;
       thing.xcor = 0; 
    }
    if (thing.dy > 0 && thing.ycor + thing.h >= height) {
       thing.dy *= -1;
       thing.ycor = height - thing.h; 
    }
    else if (thing.dy < 0 && thing.ycor <= 0) {
       thing.dy *= -1;
       thing.ycor = 0; 
    }
    for (int i = 0; i < obstacles.size(); i++){
      Thing obs = obstacles.get(i);
      if (collides(thing, obs)) {
        if (thing.dx > 0 && thing.xcor + thing.w >= obs.xcor && thing.xcor < obs.xcor) {
           thing.dx *= -1;
           thing.xcor = obs.xcor - thing.w;
        }
        if (thing.dx < 0 && thing.xcor <= obs.xcor + obs.w && thing.xcor + thing.w > obs.xcor + obs.w) {
           thing.dx *= -1;
           thing.xcor = obs.xcor + obs.w;
        }
        if (thing.dy > 0 && thing.ycor + thing.h >= obs.ycor && thing.ycor < obs.ycor) {
           thing.dy *= -1;
           thing.ycor = obs.ycor - thing.h;
        }
        if (thing.dy < 0 && thing.ycor <= obs.ycor + obs.h && thing.ycor + thing.h > obs.ycor + obs.h) {
           thing.dy *= -1;
           thing.ycor = obs.ycor + obs.h;
        }
      }
    }
}

Boolean collides(Thing one, Thing two) {
  return one.xcor < two.xcor + two.w && 
     one.xcor + one.w > two.xcor &&
     one.ycor < two.ycor + two.h &&
     one.ycor + one.h > two.ycor;
}