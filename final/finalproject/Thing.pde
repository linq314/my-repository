class Thing {
 float xcor;
 float ycor;
 int w; 
 int h;

  public Thing(float xcor, float ycor, int w, int h) {
    this.xcor = xcor;
    this.ycor = ycor;
    this.h = h;
    this.w = w; 
  }
  
  void setCoordinates(float x, float y) {
    xcor = x;
    ycor = y;
  }
  
  void setSize(int width, int height) {
    w = width;
    h = height; 
  }
}

class MovingThing extends Thing {
 float dx;
 float dy;
 float speed;
 PImage image;
 
  public MovingThing(int width, int height, float speed) {
    super(0, 0, width, height);
    this.speed = speed;
    dx = speed;
    dy = speed;
  }
   
  void move(){
    xcor += dx;
    ycor += dy;
  }
}