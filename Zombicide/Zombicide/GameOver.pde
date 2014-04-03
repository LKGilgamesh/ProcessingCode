class GameOver{
  int x,y; 
  PImage gameOver;
  GameOver(int x, int y){
    this.x = x;
    this.y = y;
    gameOver = loadImage("Gameover.jpg");
 }
 void display(){
   imageMode(CORNER);
   image(gameOver,x,y);
   textAlign(CENTER);
   text("Continue?     Yes        No",width/2,500);
   rectMode(CENTER);
   
    if(mouseX > 398 && mouseX <448 && mouseY > 479 && mouseY < 508){
      rect(423,493,50,28,3);
    }
    else if(mouseX > 471 && mouseX < 521 && mouseY > 479 && mouseY < 508){
      rect(496,493,50,28,3);
    }
 }
 void menuInteractions(){
    if(mouseX > 398 && mouseX <448 && mouseY > 479 && mouseY < 508){
      UI.reset();
      titlescreen.endTitlescreen = false;
    }
    else if(mouseX > 471 && mouseX < 521 && mouseY > 479 && mouseY < 508){
      exit();
    }
 }
}
