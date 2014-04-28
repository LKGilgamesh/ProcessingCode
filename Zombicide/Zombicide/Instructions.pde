class Instructions{
 boolean displayI;
 Instructions(){
  textAlign(CENTER);
  displayI = false;
 } 
 void display(){
   rectMode(CENTER);
   stroke(200,0,0);
   strokeWeight(7);
   fill(170,170,170);
   rect(width/2,height/2,750,550,7); 
   
   textAlign(CENTER);
   textSize(35);
   fill(0);
   text("Instructions",width/2,100);
   textSize(25);
   textAlign(LEFT);
   text("Objective: to SEARCH for the key to SafeHouse while",50,150);
   text("fending of the hordes of zombies.",50,180);
   
   textSize(30);
   textAlign(CENTER);
   text("Actions",width/2,230);
   
   textAlign(LEFT);
   textSize(25);
   text("SEARCH: character for valuable items, such as the key or",50,270);
   text("weapons",50,300);
   text("ATTACK: character will kill a nearby zombie",50,350);
   text("MOVE: Character will move in a direction",50,400);
   text("All Actions will cost a move, after 4 actions the zombie",50,450);
   text("turn begins",50,480);
   
   stroke(0);
   strokeWeight(5);
   fill(255);
   rect(680,520,115,40);
   textSize(22);
   textAlign(CENTER);
   fill(0);
   text("Return",680,527);
   if(mouseX > 623 && mouseX < 738 && mouseY > 500 && mouseY < 540){
     noFill();
     stroke(255,0,0);
     rect(680,520,115,40);
   }
 }
 void menuInteractions(){
   if(mouseX > 623 && mouseX < 738 && mouseY > 500 && mouseY < 540){
     displayI = false;
   }   
 }
}
