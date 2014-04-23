class Player{
  int xPos;
  int yPos;
  int moves;
  int health;
  int level;
  boolean hasKey;
  boolean attackMenu;
  PImage playerPic;
  
  Player(int xPos,int yPos, int moves, int health, int level, boolean hasKey){
   this.xPos = xPos;
   this.yPos = yPos;
   this.health = health;
   this.moves = moves;
   this.level = level;
   this.hasKey = hasKey;
   attackMenu = false;
   playerPic = loadImage("Zombicide Player.png");
  }
  void display(){
    rectMode(CENTER);
    fill(60,255,60);
    stroke(255);
    strokeWeight(1);
    ellipse(xPos,yPos,27,27); 
    imageMode(CENTER);
    image(playerPic,xPos,yPos);
  }
  void search(){
    moves--;
    UI.search.hasSearched = true;
    UI.i_menu.updateWeapon();
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
