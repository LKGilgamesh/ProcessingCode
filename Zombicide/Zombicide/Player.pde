class Player{
  int xPos;
  int yPos;
  int moves;
  int health;
  int level;
  boolean attackMenu;
  
  Player(int xPos,int yPos, int moves, int health, int level){
   this.xPos = xPos;
   this.yPos = yPos;
   this.health = health;
   this.moves = moves;
   this.level = level;
   attackMenu = false;
  }
  void display(){
    rectMode(CENTER);
    fill(0,0,255);
    stroke(255);
    strokeWeight(1);
    rect(xPos,yPos,20,20,15); 
  }
  void search(){
    moves--;
    UI.search.hasSearched = true;
    UI.zombies.updateZombieProx();
  }
  void attack(){
    attackMenu = true;
    
    moves--;
    level++;
    UI.zombies.updateZombieProx();
  }
  
  void takeDamage(){
   health--;
   moves--; 
  }
  void moveDown(){
    if(UI.boardwindow.downBoundary(xPos,yPos)==true){
       yPos+=100;
       println("this also works");
       moves--;
       UI.zombies.updateZombieProx();
      }
  }
  void moveLeft(){
   if(UI.boardwindow.leftBoundary(xPos,yPos)==true){
       xPos -=100;
       moves--;
       UI.zombies.updateZombieProx();
      } 
  }
  void moveRight(){
    if(UI.boardwindow.rightBoundary(xPos,yPos)==true){
      xPos +=100;
      moves--; 
      UI.zombies.updateZombieProx();
      }
  }
  void moveUp(){
      if(UI.boardwindow.upBoundary(xPos,yPos)==true){
       yPos-=100;
       println("this works");
       moves--;
       UI.zombies.updateZombieProx();
      }
  }
  
}
