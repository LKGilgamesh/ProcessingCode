/*
Class purpose:
------------------------------------------------------------------------------------
his class is primarily responsible for the board window. It loads the graphic for 
the board, renders the mystery fog, as well as handles UI interaction with the board
itself. 

Implementation:
------------------------------------------------------------------------------------
This is a child class of UserInterface.*/

class BoardWindow{
  //Member Variables
  float x;
  float y;
  PImage Board_graphic;
  MysteryFog[][] m_fog = new MysteryFog[6][4];
  
  //Constructor
  BoardWindow(float x, float y){
  this.x = x;
  this.y = y;
  Board_graphic = loadImage("CheckerBoardEX.png");
  
  //Assigns values for m_fog
   for(int i =0; i <= 5; i++){
      for(int j =0; j <= 3; j++){
         m_fog[i][j] = new MysteryFog(i,j,x);  
      }
    }

  }
  
  //Member Functions
  void drawWindow(){
  image(Board_graphic,x,y);

   for(int i =0; i <= 5; i++){
      for(int j =0; j <= 3 ; j++){
         m_fog[i][j].drawFog();
      }
    }

  }
  void showTile(){
    for(int i =0; i <= 5; i++){
      for(int j =0; j <= 3; j++){
         if((mouseX > x +i*100 && mouseX < x + i*100 +100)&&(mouseY > j*100 && mouseY < j*100+100)){
           println("(" + i + ", " + j + ")");
           if(m_fog[i][j].fog_enable)
               m_fog[i][j].fogOff();
           else
             m_fog[i][j].fogOn();
             
         }
         
      }
    }
    
  }

}
