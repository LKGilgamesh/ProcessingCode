class Search{
  boolean hasSearched;
  int lottery;
  Search(){
   hasSearched = false;
   lottery = 0; 
  }
  void searchFunction(){
    int lottery = int(random(150));
    if(lottery >= 140){
      UI.player.health++;
      println("Found: Food"); 
    }
    else if(lottery >=120){
      UI.weapon.machineGun();
      println("Found: Machine Gun"); 
    }
    else if(lottery >= 100){
      UI.weapon.sniper();
      println("Found: Sniper Rifle"); 
    }
    else if(lottery >= 70){
      UI.weapon.handGun();
      println("Found: Hand Gun"); 
    }
    else{
     println("Didn't find anything"); 
    }
    hasSearched = true;
  }
  
}
