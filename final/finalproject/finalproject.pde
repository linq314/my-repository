PImage Pineapple, Pen, Pizza,PP; 

//import processing.video.*;
//Movie ppap;

Pizza pizza = new Pizza(10, 400);
Pineapple pa = new Pineapple(500, 350);
Boolean gameOver = false;
Boolean gameWon = false;

void setup(){
  size(1000, 700);
  
  Pineapple = loadImage("Pineapple.png");
  Pen = loadImage("pen.png");
  Pizza = loadImage("pizza.png");
  PP = loadImage("pp.jpg");
  //ppap = new Movie(this, "ppap.mp4");
  //ppap.play();
 
  Pineapple.resize(20, 40);
  Pen.resize(10, 40);
  Pizza.resize(25, 40);
  PP.resize(1000,700);
  //ppap.resize(1000,700);
}
//
void draw(){
    if (gameOver == false) {
    background(255,248,205);
    image(Pizza, pizza.xcor, pizza.ycor);
    //fill(255, 20, 12);
    //rect(pizza.xcor, pizza.ycor, pizza.w, pizza.h);
    pizza.move();
    checkBounds(pizza);
  
    image(Pineapple, pa.xcor, pa.ycor);
    //fill(20, 20, 12);
    //rect(pa.xcor, pa.ycor, pa.w, pa.h);
    
    if (collides(pizza, pa)) {
      gameOver = true;
      gameWon = true;
    }
  }
  else {
     if (gameWon == true) {
        image(PP,0,0);
     }
     else {
       //image(ppap, 0, 0); 
       // ppap video 
     }
  }
  //String s = "catch the pizza";
  //textSize(30);
  //fill(255,58);
  //text(s, 20,10);
}

//void movieEvent(Movie m) {
//   m.read();
//}

void keyPressed(){
   if (keyCode == UP) {
     pa.ycor -= pa.speed;
   }
   
   if (keyCode == DOWN) {
     pa.ycor += pa.speed;
   }
   
   if (keyCode == LEFT) {
     pa.xcor -= pa.speed;
   }
   
   if (keyCode == RIGHT) {
     pa.xcor += pa.speed;
   }
   if (pa.xcor + pa.w >= width) {
       pa.xcor = width; 
     }
     else if (pa.xcor <= 0) {
       pa.xcor = 0; 
    }
    if (pa.ycor + pa.h >= height) {
       pa.ycor = height; 
    }
    else if (pa.ycor <= 0) {
       pa.ycor = 0; 
    }
}

void checkBounds(MovingThing thing){
     if (thing.dx > 0 && thing.xcor + thing.w >= width) {
       thing.dx *= -1;
       thing.xcor = width; 
     }
     else if (thing.dx < 0 && thing.xcor <= 0) {
       thing.dx *= -1;
       thing.xcor = 0; 
    }
    if (thing.dy > 0 && thing.ycor + thing.h >= height) {
       thing.dy *= -1;
       thing.ycor = height; 
    }
    else if (thing.dy < 0 && thing.ycor <= 0) {
       thing.dy *= -1;
       thing.ycor = 0; 
    }
}

Boolean collides(Thing one, Thing two) {
  return one.xcor < two.xcor + two.w && 
     one.xcor + one.w > two.xcor &&
     one.ycor < two.ycor + two.h &&
     one.ycor + one.h > two.ycor;
}