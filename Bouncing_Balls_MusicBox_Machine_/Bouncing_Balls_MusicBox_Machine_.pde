import ddf.minim.*;

Minim minim;
AudioSample music1;
AudioSample music2;
AudioSample music3;
AudioSample music4;
AudioSample music5;



//Ball Size
int xBall=50;
int yBall=50;

//Initial Position of BallA
int xPosA=25;
int yPosA=25;

//Initial Position of BallB
int xPosB=475;
int yPosB=25;

//Velocity of the Balls
int xVelA=2;
int yVelA=5;
int xVelB=5;
int yVelB=3;

//Space Setup
void setup() {
  size(500, 200);
  smooth();


  minim = new Minim(this);
  music1 = minim.loadSample("MusicBox Ab4.wav", 512);
  music2 = minim.loadSample("MusicBox C6.wav", 512) ;
  music3 = minim.loadSample("MusicBox Eb4.wav", 512);
  music4 = minim.loadSample("MusicBox G4.wav", 512);
  music5 = minim.loadSample("MusicBox F5.wav", 512);

 

}

//Bouncing Ball Setup
void draw() {
  background(30, 30, 15);
  noStroke();
  //BallA
  fill(0, 200, 200);
  ellipse(xPosA, yPosA, xBall, yBall);
  //BallB
  fill(255, 0, 200);
  ellipse(xPosB, yPosB, xBall, yBall);

  xPosA=xPosA+xVelA;
  yPosA=yPosA+yVelA;

  xPosB=xPosB+xVelB;
  yPosB=yPosB+yVelB;

  //Reverse Direction (set the value to Negative multiplying by -1)
  if (xPosA>width-xBall/2||xPosA<xBall/2) {
    xVelA=xVelA*-1;
    music1.trigger();
  }
  if (yPosA>height-xBall/2||yPosA<xBall/2) {
    yVelA=yVelA*-1;
    music2.trigger();
  }
  if (xPosB>width-xBall/2||xPosB<xBall/2) {
    xVelB=xVelB*-1;
    music3.trigger();

  }
  if (yPosB>height-xBall/2||yPosB<xBall/2) {
    yVelB=yVelB*-1;
    music4.trigger();

    
  }

  //Ball Collision
  if (dist(xPosA, yPosA, xPosB, yPosB)<=xBall) {
    xVelA=xVelA-2*xVelA;
    yVelA=yVelA-2*yVelA;
    xVelB=xVelB-2*xVelB;
    yVelB=yVelB-2*yVelB;
    music5.trigger();
   
  }

  //Collision White Flash
  if (dist(xPosA, yPosA, xPosB, yPosB)<=xBall) {
    background(255, 255, 255);
  }
}

