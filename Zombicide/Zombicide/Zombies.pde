class Zombies{
  ArrayList<zombie> zombiesArr;
  ArrayList<Integer> zombieProx;
  
 //the following are the possible positions that the zombies could spawn from
  int[] initialXPos = {023,23,177,223,577,577,577,577,377,423,177,223};
  int[] initialYPos = {177,223,23,23,177,223,377,423,577,577,577,577};
 Zombies(){
  zombiesArr = new ArrayList<zombie>();
  zombieProx = new ArrayList<Integer>();
 
  for(int i = 0;i < 12; i++){
    if(random(2)<1){
      addZombie(initialXPos[i],initialYPos[i]);
    }
  }
 } 
 void updateZombieProx(){
   zombieProx.clear();
  for(int i = 0;i < zombiesArr.size();i++){
    if(zombiesArr.get(i).playerProx() == true){
       zombieProx.add(i);
       println("zombie " + i + " added to ZProx");
    }
  } 

 }
 void display(){
   for(int i = 0;i < zombiesArr.size();i++){
    zombiesArr.get(i).display(); 
   }
 }
 void addZombie(int x, int y){
   zombiesArr.add(new zombie(x,y));
 }
 void removeZombie(int i){
   zombiesArr.remove(i);
 }
 void spawnZombies(){
   for(int i = 0;i < 12; i++){
    if(random(2)<1){
      addZombie(initialXPos[i],initialYPos[i]);
    }
   }
 }
}
