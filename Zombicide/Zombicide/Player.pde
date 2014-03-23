class Player{
  String name;
  int xPos;
  int yPos;
  int moves;
  int health;
  int level;
  int zombieSelect;
  boolean attackMenu;
  Player(String name,int xPos,int yPos){
   this.name = name; 
   this.xPos = xPos;
   this.yPos = yPos;
   health = 5;
   moves = 4;
   level = 1;
   attackMenu = false;
   zombieSelect = 0;
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
  }
  void attack(){
    attackMenu = true;
    
    moves--;
    level++;
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
      }
  }
  void moveLeft(){
   if(UI.boardwindow.leftBoundary(xPos,yPos)==true){
       xPos -=100;
       moves--;
      } 
  }
  void moveRight(){
    if(UI.boardwindow.rightBoundary(xPos,yPos)==true){
      xPos +=100;
      moves--; 
      }
  }
  void moveUp(){
      if(UI.boardwindow.upBoundary(xPos,yPos)==true){
       yPos-=100;
       println("this works");
       moves--;
      }
  }
  
}
