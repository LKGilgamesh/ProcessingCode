class combatSystem{
 int zombieSelect;
 combatSystem(){
 zombieSelect = 0; 
 }
 void display(){
   
   stroke(255);
   strokeWeight(3);
   fill(0);
   rectMode(CENTER);
   rect(700,353,130,25);
   rect(700,403,130,25);
   rect(700,433,130,25);
   

   fill(255);
   textAlign(CENTER,CENTER);
   text("Attack", 700, 350);
   text("Next",700, 400);
   text("Previous",700, 430);
   

   
   if(UI.i_menu.pMenu){
    if(mouseX > 635 && mouseX < 765 && mouseY > 340 && mouseY < 366){
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
   }
 }
  void menuInteractions(){
   if(mouseX > 635 && mouseX < 765 && mouseY > 340 && mouseY < 366){
    UI.zombies.removeZombie(UI.zombies.zombieProx.get(zombieSelect));
    println("attk Menu attack works");
    UI.player.attack();
    zombieSelect = 0;
    UI.player.attackMenu = false;
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 390 && mouseY < 416){
           println(zombieSelect);
       println(UI.zombies.zombieProx.size());
       println("worked up to here.");
    if(zombieSelect < UI.zombies.zombieProx.size()-1){
      println(zombieSelect);
      zombieSelect++;
      //UI.zombies.zombiesArr.get(zombieSelect).highlight();
      println("attk menu upselect works");
    }
    println("went into elseif statement");
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 420 && mouseY < 446){
    if(zombieSelect > 0){
    zombieSelect--;
    println("attk menu downselect works");
    }
  }
  
  if(UI.weapon.numOfAtks == 2){
    UI.zombies.updateZombieProx();
   if(mouseX > 635 && mouseX < 765 && mouseY > 340 && mouseY < 366){
    UI.zombies.removeZombie(UI.zombies.zombieProx.get(zombieSelect));
    println("attk Menu attack works");
    zombieSelect = 0;
    UI.player.attackMenu = false;
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 390 && mouseY < 416){
           println(zombieSelect);
       println(UI.zombies.zombieProx.size());
       println("worked up to here.");
    if(zombieSelect < UI.zombies.zombieProx.size()-1){
      println(zombieSelect);
      zombieSelect++;
      //UI.zombies.zombiesArr.get(zombieSelect).highlight();
      println("attk menu upselect works");
    }
    println("went into elseif statement");
  }
  else if(mouseX > 635 && mouseX < 765 && mouseY > 420 && mouseY < 446){
    if(zombieSelect > 0){
    zombieSelect--;
    println("attk menu downselect works");
    }
  } 
    
  }
 }
}
