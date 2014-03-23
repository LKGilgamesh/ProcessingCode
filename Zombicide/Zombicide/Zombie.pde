class zombie{
  int xPos, yPos;
  boolean moveUp, moveDown, moveLeft, moveRight;
  
 zombie(int xPos, int yPos){
   this.xPos = xPos;
   this.yPos = yPos;
   moveUp = true;
   moveDown = true;
   moveLeft = true;
   moveRight = true;
  }
  void display(){
    rectMode(CENTER);
    fill(255,0,0);
    stroke(255);
    strokeWeight(1);
    rect(xPos,yPos,20,20,15); 
    //println(xPos);
  }
  void highlight(){
    noFill();
    strokeWeight(2);
    stroke(255,255,0);
   rect(xPos,yPos,20,20,15); 
  }
  boolean playerProx(){
   if(abs(xPos - UI.player.xPos) < 150 && abs(yPos - UI.player.yPos) < 150){
      return true;
   } 
   else
     return false;
  }
}
