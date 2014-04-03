class Weapon{
  int range, numOfAtks;
  String currentGun;
  Weapon(){
  handGun();
 } 
 void handGun(){
  range = 1;
  numOfAtks = 1; 
  currentGun = "Hand Gun";
 }
 void machineGun(){
   range = 1; 
   numOfAtks = 2;
   currentGun = "Machine Gun";
 }
 void sniper(){
  range = 2; 
  numOfAtks = 1; 
  currentGun = "Sniper Rifle";
 }
 void bat(){
  range = 0;
 numOfAtks = 1; 
 currentGun = "bat";
 }
}
