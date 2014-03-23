class userInterface{
  InfoMenu i_menu;
Player player;
Zombies zombies;
BoardWindow boardwindow;
Turn turn;

  userInterface(){
    player = new Player("leon",200,200);
  zombies = new Zombies();
  boardwindow = new BoardWindow(0,0); 
  i_menu = new InfoMenu(602,2);
  turn = new Turn();
  }
  void display(){
     boardwindow.display(); 
     player.display();
     zombies.display();
     i_menu.display();
     i_menu.updateMoves();
     i_menu.updateLevel();
     i_menu.updateHealth();
     zombies.updateZombieProx();
     if(turn.t){
       
       turn.playerTurn();
     }
     else if(turn.t == false){
       turn.zombieTurn();
     }
     
  }
  void takeTurns(){
    
  }
}
