class MysteryFog{
  //member variable
  boolean fog_enable;
  int col;
  int row;
  float board_x;

  //constructor
    MysteryFog(){
  fog_enable = true;
  this.col = col;
  this.row = row;
  
    }
  MysteryFog(int col,int row,float board_x){
  fog_enable = true;
  this.col = col;
  this.row = row;
  this.board_x = board_x;
  }


  //member functions
  void drawFog(){
    if(fog_enable){
      fill(50,220);
      noStroke();
      rect(board_x +col*100,row*100,100,100);
    }
    if((mouseX > board_x +col*100 && mouseX < board_x + col*100 +100)&&(mouseY > row*100 && mouseY < row*100+100)){
     fill(255,80);
     noStroke();
     rect(board_x +col*100,row*100,100,100);
     
    }
    
  }
  void fogOn(){
  fog_enable = true;
  }
  void fogOff(){
  fog_enable = false;
  }
}
