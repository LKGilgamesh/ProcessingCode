
/*
Class purpose:
------------------------------------------------------------------------------------
The InfoWindow will be in charge of  Menu Interaction in game and displaying 
information and relevant to the game.

Implementation:
------------------------------------------------------------------------------------
This is a child class of UserInterface.*/

class InfoWindow{
  //Member Variables
  float x;
  float y;
  PImage soldierCard;
  
  //Constructor
InfoWindow(float x, float y){
  this.x = x;
  this.y = y;
  soldierCard = loadImage("Sample Player Card.png");
}

 //Member Funcions
  void drawWindow(){
   stroke(0);
   fill(74,88,67);
   rectMode(CORNER);
   
   rect(x,y,350,500);
   noStroke();
   
  }
  void drawPlayerCard(){
    image(soldierCard,x,y);
  }
}
