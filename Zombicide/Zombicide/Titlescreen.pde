

class Titlescreen
{
  int wCenter;
  boolean endTitlescreen;
  boolean loadEndTitlescreen;
  PImage titleImage;
  
  Titlescreen(int wCenter){
    this.wCenter = wCenter;
    endTitlescreen = false;
    loadEndTitlescreen = false;
    titleImage = loadImage("Titlescreen.jpg");
  }
  
  void display(){
      background(100);
      imageMode(CORNER);
      image(titleImage,0,0);
      rectMode(CENTER);
      fill(200,0,0);
      stroke(0);
      strokeWeight(5);
      rect(wCenter,320,200,170,5);
      
      if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 240 && mouseY < 280){
        fill(255,0,0);
        rect(wCenter,260,200,40,10); 
      }
      else if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 280 && mouseY < 320){
        fill(255,0,0);
        rect(wCenter,300,200,40,10); 
      }
      else if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 320 && mouseY < 360){
        fill(255,0,0);
        rect(wCenter,340,200,40,10); 
      }
      else if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 360 && mouseY < 400){
        fill(255,0,0);
        rect(wCenter,380,200,40,10); 
      }
      fill(0,0,0);
      textAlign(CENTER,CENTER);
     
      textSize(28);
      text("Start game",wCenter,257);
      text("Load Game",wCenter,297);
      text("Instructions",wCenter,337);
      text("Quit",wCenter,377);
  }
  void menuInteractions(){
    if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 240 && mouseY < 280){
      println("start button works");       
      endTitlescreen = true;  
    }
    else if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 280 && mouseY < 320){
      println("load button works");
      loadEndTitlescreen = true;
    load.loadGame();
    }
    else if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 320 && mouseY < 360){
      instructions.displayI = true;
      println("Introduction works");
    }
    else if(mouseX > wCenter -100 && mouseX <wCenter + 100 && mouseY > 360 && mouseY < 400){
      println("quit works");
      exit();
    }
  }
}
