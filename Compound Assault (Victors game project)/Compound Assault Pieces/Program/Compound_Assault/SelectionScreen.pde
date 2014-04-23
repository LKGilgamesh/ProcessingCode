/*
This screen will be brought up after the title menu 'new game' is selected.
The purpose of this is to have the players pick their characters.
*/

class SelectionScreen{
  float x, y;
  int a, b;
  boolean startGame;
  Unitselect[][] units;
  
  SelectionScreen(float x,float y,int a, int b){
  this.x = x;
  this.y = y;
  this.a = a;
  this.b = b;
  startGame = false;
  units = new Unitselect[a][b];
    for(int i = 0;i < a;i++){
      for(int j = 0;j<b;j++){
      units[i][j] = new Unitselect(415+125*j,100+167*i);
      }
    }
  }
  
  void unitSelection(){
    fill(0,0,0);
    for(int i = 0;i < a;i++){
      for(int j = 0;j<b;j++){
      units[i][j].drawRect();
      }
    }
  }
  void updateSelectionScreen()
  {
    stroke(0,255,0);
    strokeWeight(6);
    for(int i = 0;i < a;i++){
      for(int j = 0;j<b;j++){
        if(mouseX > units[i][j].x && mouseX < units[i][j].x+100 && mouseY > units[i][j].y && mouseY < units[i][j].y+100)
        {
          rect(units[i][j].x,units[i][j].y,100,100); 
          units[i][j].playerCard = true;
        }
        else{
         units[i][j].playerCard = false; 
        }
      }
    }
  }
  
  void menuInteraction()
  {
    stroke(0,255,0);
    strokeWeight(6);
    for(int i = 0;i < a;i++){
      for(int j = 0;j<b;j++){
        if(mouseX > units[i][j].x && mouseX < units[i][j].x+100 && mouseY > units[i][j].y && mouseY < units[i][j].y+100)
        {
          if(units[i][j].s ==0)
         {
            units[i][j].s = 255;
            units[i][j].sw = 6;
         }  
         else{
           units[i][j].s = 0;
            units[i][j].sw = 5;
         }
        }
      }
    }
  }
  void nextButton(){
    if(mouseX > 740 && mouseX < 890 && mouseY > 410 && mouseY < 460){
      fill(255,0,0);
      stroke(6);
     rect(740,410,150,50);
    }
  }
  void finishSelect(){
    if(mouseX > 740 && mouseX < 890 && mouseY > 410 && mouseY < 460){
      startGame = true;
    }
  }    
    
  
  void drawWindow(){
    rectMode(CORNER);
    fill(255,255,255);
    rect(x,y,600,500);
    unitSelection();
    rect(740,410,150,50);
  }
}
