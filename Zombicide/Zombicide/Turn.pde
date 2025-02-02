class Turn{
  int turn_Counter;
  boolean t;
 Turn(){
  turn_Counter = 1;
  t = true;
 } 
 void playerTurn(){
   if(UI.player.moves == 0){
     t = false;
   }
 }
 void zombieTurn(){
   for(int i = 0;i < UI.zombies.zombiesArr.size();i++ ){
     if(abs(pYPos() - zYPos(i)) == 23 && abs(pXPos() - zXPos(i)) == 23){
       println("player took damage");
       UI.player.takeDamage();
     }
     else if(abs(pYPos() - zYPos(i)) == 23){

       if(pXPos() > zXPos(i) && UI.boardwindow.rightBoundary(zXPos(i), zYPos(i)) == true){ //right
         UI.zombies.zombiesArr.get(i).xPos += 100;
         if(zXPos(i) == 623)
         {
             UI.zombies.zombiesArr.get(i).xPos -= 46;
         }
         println(i + "RIGHT");
       }
       else if(pXPos() < zXPos(i) && UI.boardwindow.leftBoundary(zXPos(i), zYPos(i)) == true){ //left
         UI.zombies.zombiesArr.get(i).xPos -= 100;
         println(i + "LEFT");
         if(zXPos(i) == -23)
         {
             UI.zombies.zombiesArr.get(i).xPos += 46;
         }
       }
     }
     else if(abs(pXPos() - zXPos(i)) == 23){
       if(pYPos() < zYPos(i) && UI.boardwindow.upBoundary(zXPos(i), zYPos(i)) == true){ //up
         UI.zombies.zombiesArr.get(i).yPos -= 100;
         println(i + "UP");
         if(zYPos(i) == -23)
         {
             UI.zombies.zombiesArr.get(i).yPos += 46;
         }
       }
       else if(pYPos() > zYPos(i) && UI.boardwindow.downBoundary(zXPos(i), zYPos(i)) == true){ //down
         UI.zombies.zombiesArr.get(i).yPos += 100;
         println(i + "DOWN");
         if(zYPos(i) == 623)
         {
             UI.zombies.zombiesArr.get(i).yPos -= 46;
         }
       }
     }
     else if(pXPos() > zXPos(i) && UI.boardwindow.rightBoundary(zXPos(i), zYPos(i)) == true){ //right
         UI.zombies.zombiesArr.get(i).xPos += 100;
         println(i+"2RIGHT2");
         if(zXPos(i) == 623)
         {
             UI.zombies.zombiesArr.get(i).xPos -= 46;
         }
     }
     else if(pXPos() < zXPos(i) && UI.boardwindow.leftBoundary(zXPos(i), zYPos(i)) == true){ //left
         UI.zombies.zombiesArr.get(i).xPos -= 100;
         println(i+"2LEFT2");
         if(zXPos(i) == -23)
         {
             UI.zombies.zombiesArr.get(i).xPos += 46;
         }
     }
     else if(pYPos() < zYPos(i) && UI.boardwindow.upBoundary(zXPos(i), zYPos(i)) == true){ //up
         UI.zombies.zombiesArr.get(i).yPos -= 100;
         println(i+"2UP2");
         if(zYPos(i) == -23)
         {
             UI.zombies.zombiesArr.get(i).yPos += 46;
         }
     }
     else if(pYPos() > zYPos(i) && UI.boardwindow.downBoundary(zXPos(i), zYPos(i)) == true){ //down
         UI.zombies.zombiesArr.get(i).yPos += 100;
         println(i+"2DOWN2");
         if(zYPos(i) == 623)
         {
             UI.zombies.zombiesArr.get(i).yPos -= 46;
         }
     }
   }
   turn_Counter++;
   
   UI.zombies.spawnZombies();
   t= true;
   UI.player.moves= 4;
   println(t);
   UI.search.hasSearched = false;
   UI.zombies.updateZombieProx();
 }
 int pYPos(){
  return UI.player.yPos; 
 }
 int pXPos(){
  return UI.player.xPos; 
 }
 int zYPos(int i){
   return UI.zombies.zombiesArr.get(i).yPos;
 }
 int zXPos(int i){
   return UI.zombies.zombiesArr.get(i).xPos;
 }
}
