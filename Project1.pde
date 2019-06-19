//Global Variables
int money = 0;
int c1 = 0;
int c2 = 0;
int c3 = 0;
PVector ball[] = new PVector[5];
PVector speed[] = new PVector[5];PVector drag;


//Ball Function
void ballbounce(int a) {
  for (int i =0; i<a; i++) {
    ball[i] = new PVector();
    ball[i].x = random(10);
    ball[i].y = random(10);
  }
  for (int i =0; i<a; i++) {
    ball[i] = new PVector();
    ball[i].x = random(10);
    ball[i].y = random(10);
  }
  for (int i =0; i<a; i++) {
    ball[i] = new PVector();
    ball[i].x = random(10);
    ball[i].y = random(10);
  }
  for (int i =0; i<a; i++) {
    ball[i] = new PVector();
    ball[i].x = random(10);
    ball[i].y = random(10);
  }
  for (int i=0; i<a; i++) {
    ball[i] = new PVector();
    ball[i].x = random(10);
    ball[i].y = random(10);
  }
}  

//Ball Speed Function
void ballspeed(int a) {
  for (int i = 0; i<a; i++) {
    speed[i] = new PVector();
    speed[i].x = random(1.15, 1.2);
    speed[i].y = random(0.2, 1.2);
  }
}

void setup() {
  size(640, 480);
  ballbounce(5);
  ballspeed(5);
  drag = new PVector(0, 0.2);
}

void draw() {
 
  //Background
  for (int i = 0; i<height; i+=50) {
    noStroke();
    fill(c3, c2, i);
    rect(0, -50+i, width, i);
  }

  //Grass Floor
  fill(#7FFF00);
  rect(0, 405, 640, 100);

  //Ball
  fill(#852A17);
  for (int i=0; i < ball.length; i++) {
    ellipse(ball[i].x, ball[i].y, 50, 50);
    ball[i].add(speed[i]);
    speed[i].add(drag);
  }

  //Basket
  fill(#808080);
  rect(540, 315, 200, 90);

  //Bill The Alien
  fill(#C0C0C0);
  ellipse(mouseX, 395, 50, 20);
  ellipse(mouseX, 380, 35, 20);
  ellipse(mouseX, 370, 30, 20);
  ellipse(mouseX, 350, 70, 50);
  fill(000000);
  ellipse(mouseX-35, 350, 30, 20);
  ellipse(mouseX-5, 350, 30, 20);
  rect(mouseX-15, 300, 70, 35);
  rect(mouseX-25, 290, 50, 35);

  //Ball Restrictions and Setup
  float ifs[] = new float[5];
  for (int i =0; i < ball.length; i++) {
    if ((ball[i].x+25> width) || (ball[i].x<0)) {
      speed[i].x = speed[i].x * -1;
    }
    if ((ball[i].y > height - 50)) {
      speed[i].y = -abs(speed[i].y * 0.95);
    }
    if (ball[i].x>mouseX - 20 && ball[i].x < mouseX + 110 && ball[i].y > 290) {
      speed[i].y = -abs(speed[i].y);
    }
    //Basket Ball Collection Mechanics
    if (ball[i].x > 550 && ball[i].x < width && ball[i].y > 400) {
      money += 6;
      speed[i].x = random(1.15, 1.2);
      speed[i].y = random(0.2, 1.2);
      ball[i].x = random(10);
      ball[i].y = random(10);
    }
    //Game Over Screen
    if(ball[i].y > height - 75){
    speed[i].x = 0;
    speed[i].y = 0;
    boolean gameover = true;
    background(255, 0, 0);
    
   }
  }
  
  //Scoreboard Mechanics
  textAlign(RIGHT);
  fill(255);
  textSize(32);
  text("$"+money, 600, 60);
}
