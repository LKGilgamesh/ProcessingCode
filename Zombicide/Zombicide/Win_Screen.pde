class Win_Screen{
 Win_Screen(){
 background(0);
 }
 void display(){
   background(0);
   textSize(40);
   text("You Win!",width/2, 200);
   textAlign(CENTER);
   textSize(18);
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
