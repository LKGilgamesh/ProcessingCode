class BoardWindow{
 PImage boardImage;
 float x;
 float y;
 
 
 BoardWindow(float x,float y)
 {
   this.x = x;
   this.y = y;
   boardImage = loadImage("zombicide_map.jpg"); 
 }
 
 void display(){
   noFill();
   image(boardImage,x,y,600,600); 
 }
 
boolean leftBoundary(int xPos,int yPos){
 if(xPos > 150 && xPos < 250 && yPos >= 0 && yPos < 150 || xPos > 150 && xPos < 250 && yPos > 250 && yPos <=600 ||
    xPos > 350 && xPos < 450 && yPos > 250 && yPos < 550 || xPos > 550 && xPos <=600 && yPos > 250 && yPos < 350 || xPos >=0 && xPos < 50){
  return false; 
 }
 else{
  return true; 
 }
}
boolean rightBoundary(int xPos,int yPos){
 if(xPos > 150 && xPos < 250 && yPos >= 0 && yPos < 150 || xPos > 150 && xPos < 250 && yPos > 250 && yPos < 550 ||
    xPos > 350 && xPos < 450 && yPos > 250 && yPos < 350 || xPos > 350 && xPos < 450 && yPos > 450 && yPos <= 600 || xPos > 550 && xPos <= 600){
  return false; 
 }
 else{
 return true;}
 
}
boolean upBoundary(int xPos,int yPos){
 if(xPos >=0 && xPos < 150 && yPos > 150 && yPos < 250 || xPos > 250 && xPos <= 600 && yPos > 150 && yPos < 250 ||
    xPos > 450 && xPos < 550 && yPos > 350 && yPos < 450 || xPos > 250 && xPos < 350 && yPos > 550 && yPos <= 600 || 
    yPos >=0 && yPos < 50){
  return false; 
 }
 else{
 return true;}
}
boolean downBoundary(int xPos,int yPos){
 if(xPos >= 0 && xPos < 150 && yPos > 150 && yPos < 250 ||xPos > 250 && xPos < 350 && yPos > 150 && yPos < 250 || 
    xPos > 450 && xPos < 550 && yPos > 150 && yPos < 250 ||xPos > 450 && xPos <=600 && yPos > 350 && yPos < 450||
    yPos >550 && yPos <=600){
  return false; 
 }
 else{
 return true;}
}
}
