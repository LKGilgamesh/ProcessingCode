class Keys{
  int xPos, yPos;
  Keys(){
    int p = ceil(random(13));
    if(p == 1){
      xPos = 200;
      yPos = 100;
    }
    else if(p == 2){
      xPos = 200;
      yPos = 200;
    }
    else if(p == 3){
      xPos = 100;
      yPos = 200;
    }  
    else if(p == 4){
      xPos = 200;
      yPos = 300;
    } 
    else if(p == 5){
      xPos = 200;
      yPos = 400;
    } 
    else if(p == 6){
      xPos = 200;
      yPos = 500;
    } 
    else if(p == 7){
      xPos = 300;
      yPos = 200;
    } 
    else if(p == 8){
      xPos = 400;
      yPos = 200;
    } 
    else if(p == 9){
      xPos = 500;
      yPos = 200;
    } 
    else if(p == 10){
      xPos = 400;
      yPos = 300;
    } 
    else if(p == 11){
      xPos = 400;
      yPos = 400;
    } 
    else if(p == 12){
      xPos = 400;
      yPos = 500;
    } 
    else if(p == 13){
      xPos = 500;
      yPos = 400;
    } 
    else{
      println("shouldn't be here");
    } 
 } 
 boolean onKey(){
  if(xPos == UI.player.xPos && yPos == UI.player.yPos){
    return true;
  } 
  else{
    return false;
  }
 }
 void deleteKey(){
  xPos = 0;
  yPos = 0; 
 }
 void placeKey(){
   int p = ceil(random(13));
    if(p == 1){
      xPos = 200;
      yPos = 100;
    }
    else if(p == 2){
      xPos = 200;
      yPos = 200;
    }
    else if(p == 3){
      xPos = 100;
      yPos = 200;
    }  
    else if(p == 4){
      xPos = 200;
      yPos = 300;
    } 
    else if(p == 5){
      xPos = 200;
      yPos = 400;
    } 
    else if(p == 6){
      xPos = 200;
      yPos = 500;
    } 
    else if(p == 7){
      xPos = 300;
      yPos = 200;
    } 
    else if(p == 8){
      xPos = 400;
      yPos = 200;
    } 
    else if(p == 9){
      xPos = 500;
      yPos = 200;
    } 
    else if(p == 10){
      xPos = 400;
      yPos = 300;
    } 
    else if(p == 11){
      xPos = 400;
      yPos = 400;
    } 
    else if(p == 12){
      xPos = 400;
      yPos = 500;
    } 
    else if(p == 13){
      xPos = 500;
      yPos = 400;
    } 
    else{
      println("shouldn't be here");
    } 
 }
}
