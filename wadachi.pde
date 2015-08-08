/*
*cha1ra.com
*2014.12.31
 */


PImage img;
int time;
float[][] dots;
int sizeImg;
int imgX,imgY;

void setup() {
  
  //size(600, 800);
  size(window.innerWidth, window.innerHeight); 
  if(width<height){
    if(width<400){
      img = loadImage("http://blog.cha1ra.com/etc/wadachi/src/wadachi-ss.png");
      sizeImg = 200;    
    }else if(width<600){
      img = loadImage("http://blog.cha1ra.com/etc/wadachi/src/wadachi-s.png");
      sizeImg = 400;
    }else if(width<1000){
      img = loadImage("http://blog.cha1ra.com/etc/wadachi/src/wadachi-m.png");
      sizeImg = 600;
    }else{
      img = loadImage("http://blog.cha1ra.com/etc/wadachi/src/wadachi-l.png");
      sizeImg = 1000;
    }
  }else{
    if(height<600){
      img = loadImage("http://blog.cha1ra.com/etc/wadachi/src/wadachi-s.png");
      sizeImg = 400;
    }else if(height<1000){
      img = loadImage("http://blog.cha1ra.com/etc/wadachi/src/wadachi-m.png");
      sizeImg = 600;
    }else{
      img = loadImage("http://blog.cha1ra.com/etc/wadachi/src/wadachi-l.png");
      sizeImg = 1000;
    }
  }
  
  time = 0;
  fill(0);
  rect(0, 0, width, height);
  imgX = (width/2) - (sizeImg/2);
  imgY = (height/2) - (sizeImg/2);

  dots = new float[20][8];//x,y,speed
  for (int i=0; i<dots.length; i++) {
    if(i==0){
      dots[i][0] = imgX;//x
      dots[i][1] = imgY;//y
    }else if(i<10){
      dots[i][0] = random(imgX,imgX+2);//x
      dots[i][1] = random(imgY,imgY+sizeImg);//y
    }else{
      dots[i][0] = random(imgX+sizeImg-2,imgX+sizeImg);//x
      dots[i][1] = random(imgY,imgY+sizeImg);//y
    }
    
    if(i==0){
      dots[i][2] = 3;
      dots[i][3] = 3;
    }else{ 
      dots[i][2] = random(1, 5);//speedX
      dots[i][3] = random(1, 5);//speedY
    }
    dots[i][4] = random(255);//R
    dots[i][5] = random(255);//G
    dots[i][6] = random(255);//B
    dots[i][7] = random(20, 80);//sizeImg
  }
  noStroke();
}

void draw() {
  if (60<time && time<100) {
    phase0();
  } else if (time>=100 &&time < 500) {
    phase1();
  } else if (time > 600) {
    phase2();
  }
  imageMode(CENTER);
  image(img, width/2, height/2);
  flameMake();
  time++;
}

void phase0() {
  if (dots[0][0]+dots[0][2]<=imgX || dots[0][0]+dots[0][2]>=imgX+sizeImg) {
    dots[0][2] *= -1;
    dots[0][0] += dots[0][2];
  } else {
    dots[0][0] += dots[0][2];
  }
  if (dots[0][1]+dots[0][3]<=imgY || dots[0][1]+dots[0][3]>=imgY+sizeImg) {
    dots[0][3] *= -1;
    dots[0][1] += dots[0][3];
  } else {
    dots[0][1] += dots[0][3];
  }
  fill(dots[0][4], dots[0][5], dots[0][6]);
  ellipse(dots[0][0], dots[0][1], dots[0][7], dots[0][7]);
}


void phase1() {
  for (int i=0; i<dots.length; i++) {

    if (time<400) {
      if (dots[i][0]+dots[i][2]<=imgX || dots[i][0]+dots[i][2]>=imgX+sizeImg) {
      dots[i][2] *= -1;
      dots[i][0] += dots[i][2];
      } else {
        dots[i][0] += dots[i][2];
      }
      if (dots[i][1]+dots[i][3]<=imgY || dots[i][1]+dots[i][3]>=imgY+sizeImg) {
        dots[i][3] *= -1;
        dots[i][1] += dots[i][3];
      } else {
        dots[i][1] += dots[i][3];
      }
    }else{
      dots[i][0] += dots[i][2];
      dots[i][1] += dots[i][3];
    }
    
    fill(dots[i][4], dots[i][5], dots[i][6]);
    ellipse(dots[i][0], dots[i][1], dots[i][7], dots[i][7]);
  }
}

void phase2() {
  if (time>700) {
    fill(255, 255, 255, 10);
  } else {
    fill(255, 255, 255, 2);
  }
  rect(0, 0, width, height);
  if(time == 760){
    link("http://blog.koe11.net");
  }
}

void flameMake(){
  fill(0);
  rect(0,0,imgX,height);
  rect(width-imgX,0,imgX,height);
  rect(0,0,width,imgY);
  rect(0,height-imgY,width,imgY);
}

