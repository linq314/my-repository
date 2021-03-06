PImage tree1, tree2, tree3, hellfire, background, darkbackground;
Tree[] trees = new Tree[60];
HashMap<String, PImage> images = new HashMap<String, PImage>();
int numTrees = 60;

class Tree {
  float x; 
  float y;
  int height; 
  int width; 
  String type; 
  boolean isVisible;
  
  public Tree(float xcor, float ycor, int h, int w, String t) {
    x = xcor;
    y = ycor;
    height = h;
    width = w;
    type = t; 
    isVisible = true;
  }
}

void setup(){
  size(1000,700);
  
  tree1 = loadImage("smalltree.png");
  tree2 = loadImage("bigtree.png");
  tree3 = loadImage("skinnytree.png"); 
  hellfire = loadImage("Hell.gif");
  background = loadImage("background.jpg");
  darkbackground = loadImage("backgrounddark.jpg"); 
  
  images.put("tree1", tree1);
  images.put("tree2", tree2);
  images.put("tree3", tree3);
  
  for(int i = 0; i < 60; i++){
    float x = random(-50, 900);
    float y = random(230, 470);
    int type = (int)(Math.random() * 3) + 1;
    if (type == 1){
      trees[i] = new Tree(x, y, 250, 100, "tree1");
    }
    else if (type == 2){
      trees[i] = new Tree(x, y, 250, 250, "tree2");
    }
    else {
      trees[i] = new Tree(x, y, 250, 100, "tree3");
    }
  }
}

void draw() {
  if (numTrees == 0) {
    image(hellfire, 0, 0, width, height);
  }
  else {
    tint(255, 255);
    image(background, 0, 0);
    tint(255, 127);
    image(darkbackground, 0, 0);
    tint(255, 255);
  
    for (int i = 0; i < 60; i++){
      if (trees[i].isVisible) {
        image(images.get(trees[i].type), trees[i].x, trees[i].y, trees[i].width, trees[i].height);
      }
    }
    //for (int i = 0; i<60; i++){
    //  if(numTrees < 10){
    //    background(darkbackground);
      //}
    //}  
  }
  
  
} // end of draw

boolean inBounds(float mx, float my, Tree tree) {
  return mx >= tree.x && mx <= tree.x + tree.width &&
         my >= tree.y && my <= tree.y + tree.height;
}

void mousePressed() {
  for (int i = 0; i < 60; i++) {
    if (trees[i].isVisible && inBounds(mouseX, mouseY, trees[i])) {
      trees[i].isVisible = false;
      numTrees -= 1;
      return;
    }
  }
}