class userInterface{
  InfoMenu i_menu;
  Player player;
  Zombies zombies;
  BoardWindow boardwindow;
  Turn turn;
  Weapon weapon;
  Search search;
  GameOver gameover;
  combatSystem csystem;
  
  userInterface(){
    player = new Player("leon",200,200);
    zombies = new Zombies();
    boardwindow = new BoardWindow(0,0); 
    i_menu = new InfoMenu(602,2);
    turn = new Turn();
    weapon = new Weapon();
    search = new Search();
    gameover = new GameOver(0,0);
    csystem = new combatSystem();
  }
  void display(){
     
     if(player.health <= 0){
       gameover.display();
     }
     else{
     boardwindow.display(); 
     player.display();
     zombies.display();
     i_menu.display();
     i_menu.updateMoves();
     i_menu.updateLevel();
     i_menu.updateHealth();
       if(turn.t){
         turn.playerTurn();
       }
       else if(turn.t == false){
         turn.zombieTurn();
       }
       if(UI.player.attackMenu == true) { 
         zombies.zombiesArr.get(zombies.zombieProx.get(csystem.zombieSelect)).highlight();
       }
     }
  }
  void reset(){
    player.health = 5;
    player.moves = 4;
    player.level = 1;
    zombies.zombiesArr.clear();
    zombies.zombieProx.clear();
    zombies.spawnZombies(); 
  }
}
