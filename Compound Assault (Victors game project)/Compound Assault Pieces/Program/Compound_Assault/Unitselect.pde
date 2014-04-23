/*
This class will house the units that are available for the game.
*/



class Unitselect{
  int x,y;
  int s = 0;
  int sw = 5;
  boolean playerCard;
  PImage soldier;
  
 Unitselect(int x,int y){
  this.x = x;
  this.y = y;
  playerCard = false;
  soldier = loadImage("Soldier.png");
 } 
 void drawRect(){
  image(soldier,x,y,100,100);
     noFill();
     stroke(0,s,0);
   strokeWeight(sw);
  rect(x,y,100,100); 
 }
}
