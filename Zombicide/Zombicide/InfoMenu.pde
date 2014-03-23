class InfoMenu{
  float x, y;
  String health, moves, level;
 InfoMenu(float x, float y){
  this.x = x;
  this.y = y;
  health = "HP: 5";
  moves = "Moves: 3";
  level = "lvl: 1";
 } 
 void updateHealth(){
  health = health.substring(0,4) + UI.player.health; 
 }
 void updateLevel(){
  level = level.substring(0,5) + UI.player.level; 
 }
 void updateMoves(){
  moves = moves.substring(0,7) +  UI.player.moves;
 }
 void display(){
   stroke(255);
   strokeWeight(5);
   fill(0);
   rectMode(CORNER);
  rect(x,y,194,594,4); 
  
  rectMode(CENTER);
  strokeWeight(3);
  rect(700,303,130,25);
  rect(700,353,130,25);
  rect(700,403,130,25);
  rect(700,433,130,25);
  rect(700,463,130,25);
  rect(700,493,130,25);
  
  textSize(20);
  fill(255);
  textAlign(CENTER,CENTER);
  text("Search", 700, 300);
  text("Attack", 700, 350);
  text("Move Up", 700, 400);
  text("Move Down", 700, 430);
  text("Move Right", 700, 460);
  text("Move Left", 700, 490);
  
  textAlign(LEFT);
  textSize(18);
  text(health, 612, 30);
  
  textAlign(RIGHT);
  text(level, 788, 30);
  text(moves, 788, 570);
  
  if(mouseX > 635 && mouseX < 765 && mouseY > 290 && mouseY < 316){
    noFill();
    stroke(255,0,0);
    rect(700,303,130,25);
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 340 && mouseY < 366){
    noFill();
    stroke(255,0,0);
    rect(700,353,130,25);
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 390 && mouseY < 416){
    noFill();
    stroke(255,0,0);
    rect(700,403,130,25);
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 420 && mouseY < 446){
    noFill();
    stroke(255,0,0);
    rect(700,433,130,25);
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 450 && mouseY < 476){
    noFill();
    stroke(255,0,0);
    rect(700,463,130,25);
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 480 && mouseY < 506){
    noFill();
    stroke(255,0,0);
    rect(700,493,130,25);
  }
  
 }
 void menuInteractions(){
  if(mouseX > 635 && mouseX < 765 && mouseY > 290 && mouseY < 316){
    println("this works");
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 340 && mouseY < 366){
    if(UI.zombies.zombieProx.size() > 0){
    UI.player.attackMenu = true;
    }
    println("this works");
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 390 && mouseY < 416){
    UI.player.moveUp();
    
    println("this works");
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 420 && mouseY < 446){
    UI.player.moveDown();
    println("this works");
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 450 && mouseY < 476){
    UI.player.moveRight();
    println("this works");
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 480 && mouseY < 506){
    UI.player.moveLeft();
    println("this works");
  } 
 }
 void attackMenu(){
   int i = 0;
   int zombieSelect = UI.zombies.zombieProx.get(i);
   UI.zombies.zombiesArr.get(zombieSelect).highlight();
   if(mouseX > 635 && mouseX < 765 && mouseY > 340 && mouseY < 366){
     UI.zombies.removeZombie(zombieSelect);
    println("this works");
    UI.player.attack();
    UI.player.attackMenu = false;
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 390 && mouseY < 416){
    if(UI.zombies.zombieProx.size() - 1 > i){
    i++;
    zombieSelect = UI.zombies.zombieProx.get(i);
    UI.zombies.zombiesArr.get(zombieSelect).highlight();
    println("this works");
    }
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 420 && mouseY < 446){
    if(i > 0){
    i--;
    zombieSelect = UI.zombies.zombieProx.get(i);
    UI.zombies.zombiesArr.get(zombieSelect).highlight();
    }
  }
 }
}
