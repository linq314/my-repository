class Thing {
 float xcor;
 float ycor;
 float w; 
 float h;

  public Thing(float xcor, float ycor, float w, float h) {
    this.xcor = xcor;
    this.ycor = ycor;
    this.h = h;
    this.w = w; 
  }
}

class MovingThing extends Thing {
 float dx;
 float dy;
 
 public MovingThing(float xcor, float ycor, float width, float height, float dx, float dy) {
    super(xcor, ycor, width, height);
    this.dx = dx;
    this.dy = dy;
  }
   
   void move(){
     xcor += dx;
     ycor += dy;
   }
}

class Pizza extends MovingThing {
  public Pizza(float xcor, float ycor) {
     super(xcor, ycor, 20, 15, 8, 8);
  }
}

class Pineapple extends Thing {
  float speed = 8;
  public Pineapple(float xcor, float ycor) {
     super(xcor, ycor, 20, 15);
  }
}