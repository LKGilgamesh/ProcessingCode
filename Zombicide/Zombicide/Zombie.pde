class zombie{
  int xPos, yPos;
  boolean moveUp, moveDown, moveLeft, moveRight;
  PImage zombiePic;
  
 zombie(int xPos, int yPos){
   this.xPos = xPos;
   this.yPos = yPos;
   moveUp = true;
   moveDown = true;
   moveLeft = true;
   moveRight = true;
   zombiePic = loadImage("Zombicide Zombiepng.png");
  }
  void display(){
    rectMode(CENTER);
    fill(0,0,0);
    stroke(255);
    strokeWeight(1);
    ellipse(xPos,yPos,29,29);
    imageMode(CENTER);
    image(zombiePic,xPos,yPos);
    //println(xPos);
  }
  void highlight(){
    noFill();
    strokeWeight(2);
    stroke(255,255,0);
    ellipse(xPos,yPos,29,29); 
  }
  boolean playerProx(){
   if(abs(xPos - UI.player.xPos) < (150+((UI.weapon.range-1)*100))&& abs(yPos - UI.player.yPos) < (150+((UI.weapon.range-1)*100))){
      return true;
   } 
   else
     return false;
  }
}
