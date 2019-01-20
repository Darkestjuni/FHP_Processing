//Best 8-bit pong
//Leon Wolff
//This program will let you play pong with 2 players
//Controls: Arrow Keys Up & down, Command & Shift

import processing.sound.*;
SoundFile BGm, 
  collision, 
  jump, 
  death, 
  spawn;

boolean 
  l = true, 
  m = false;

float []xhistory = new float[2000000];
float []yhistory = new float[2000000];

int
  i = 0,
  num = 3, 
  rad = 10, 
  points1 = 0, 
  points2 = 0;


float 
  xspeed = 2.8, 
  yspeed = 2.2, 
  xpos, 
  ypos, 
  xposalt1, xposalt2, xposalt3, 
  yposalt1, yposalt2, yposalt3, 
  xdir = 1, 
  ydir = 1, 
  player1X = 20, 
  player1Y = 240, 
  player2X = 700, 
  player2Y = 240;



void setup() {

  //general settings
  size (720, 480);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(60);
  BGm = new SoundFile(this, "BG.mp3");
  collision = new SoundFile(this, "collision.wav");
  jump = new SoundFile(this, "jump.wav");
  death = new SoundFile(this, "death.wav");
  spawn = new SoundFile(this, "spawn.wav");

  xpos=width/2; 
  ypos=height/2;
}

void keyPressed() {
  if (keyCode == ' ') {
    if (BGm.isPlaying()==true) {
      BGm.pause();
    } else if (BGm.isPlaying()==false) {
      BGm.play();
    }
  }
  if (keyCode == ENTER) {
    if (l) {
      noLoop(); 
      l = !l;
    } else if (!l) {
      loop();
      l = !l;
    }
  }
}


void draw() {
  if (m==false) {
    BGm.play();
    m = true;
  }
  fill(255);
  background(100);
  //velocity definition ball
  xpos = xpos + ( xspeed * xdir );
  ypos = ypos + ( yspeed * ydir );
  //intersection checking ball
  if (xpos > width-rad || xpos < rad) {
    xdir *=-1;
    jump.play();
  }
  if (ypos > height-rad || ypos < rad) {
    ydir *=-1;
    jump.play();
  }
  /*
  if (xpos < 20 || xpos > 710) {
   xpos = width/2;
   ypos = height/2;
   }*/
  if (keyPressed == true) {
    //player2
    if (keyCode == UP) {
      if (player2Y > 40) {
        player2Y = player2Y-14;
      }
    }
    if (keyCode == DOWN) {
      if (player2Y < 440) {
        player2Y = player2Y+14;
      }
    }
    //player 1

    if (keyCode == SHIFT) {
      if (player1Y > 40) {
        player1Y = player1Y-14;
      }
    }

    if (keyCode == CONTROL) {
      if (player1Y < 440) {
        player1Y = player1Y+14;
      }
    }
  }
  
  /*
  //Trail Calc
   if (xdir > 0) {
   xposalt1 = xpos-5;
   xposalt2 = xpos-10;
   xposalt3 = xpos-15;
   } else {
   xposalt1 = xpos+5;
   xposalt2 = xpos+10;
   xposalt3 = xpos+15;
   }
   if (ydir > 0) {
   yposalt1 = ypos-5;
   yposalt2 = ypos-10;
   yposalt3 = ypos-15;
   } else {
   yposalt1 = ypos+5;
   yposalt2 = ypos+10;
   yposalt3 = ypos+15;
   }
   */
  //Trail
  if(i>3){
  fill(0, 191, 255, 80);
  ellipse(xhistory[i-1], yhistory[i-1], rad, rad);
  fill(0, 191, 255, 50);
  ellipse(xhistory[i-2], yhistory[i-2], rad, rad);
  fill(0, 191, 255, 20);
  ellipse(xhistory[i-3], yhistory[i-3], rad, rad); 
  }
  //ball
  fill(255);
  ellipse(xpos, ypos, rad, rad); 
  
  //player bars
  fill(255);
  rect(player1X, player1Y, 8, 70);
  rect(player2X, player2Y, 8, 70);

  //Left Reset
  if (xpos < 22) {
    if (ypos < (player1Y + 35) && ypos > (player1Y - 35)) {
      xdir = -(xdir) + 0.75;
      collision.play();
    } else {
      death.play();
      delay(300);
      xdir = 1;
      xpos=width/2; 
      ypos=height/2;
      points1 = points1+1;
      spawn.play();
    }
  }
  //Right Reset
  if (xpos > 692) {
    if (ypos < (player2Y + 35) && ypos > (player2Y - 35)) {
      xdir = -(xdir) -0.75;   
      collision.play();
    } else {
      death.play();
      delay(300);
      xdir = 1;
      xpos=width/2; 
      ypos=height/2;
      points2 = points2+1;
      spawn.play();
    }
  }
  //Controls Left
  fill(70);
  textSize(12);
  textAlign(LEFT);
  text("Shift", 40, 455);
  text("Command", 40, 470);
  //Controls Right
  textAlign(RIGHT);
  fill(70);
  text("Arrow Up", 680, 455);
  text("Arrow Down", 680, 470);
  //Points Counter
  textAlign(CENTER, CENTER);
  text("Enter to pause", 360, 455);
  text("Space to mute", 360, 470);
  fill(110);
  textSize(60);
  text(points2+":"+points1, 360, 240);
  
  if(i < 2000000){
  xhistory[i] = xpos;
  yhistory[i] = ypos;
  i++;
  }
}
