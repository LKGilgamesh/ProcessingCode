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
  Keys keys;
  Win_Screen w_screen;
  
  userInterface(){
    player = new Player(200,200,4,5,1,false);
    zombies = new Zombies();
    boardwindow = new BoardWindow(0,0); 
    i_menu = new InfoMenu(602,2);
    turn = new Turn();
    weapon = new Weapon();
    search = new Search();
    gameover = new GameOver(0,0);
    csystem = new combatSystem();
    keys = new Keys();
    w_screen = new Win_Screen();
  }
  void display(){
     if(player.xPos == 500 && player.yPos == 300){
       w_screen.display();
       music.stopGameTheme();
     }
     else if(player.health <= 0){
       gameover.display();
       music.stopGameTheme();
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
         csystem.display();
       }
       else{
         i_menu.displayMenu();
       }
       
     }
     
  }
  void reset(){
    player.health = 5;
    player.moves = 4;
    player.level = 1;
    player.hasKey = false;
    player.xPos = 200;
    player.yPos = 200;
    keys.placeKey();
    zombies.zombiesArr.clear();
    zombies.zombieProx.clear();
    zombies.spawnZombies(); 
  }
}
