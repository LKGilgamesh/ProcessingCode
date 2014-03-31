Time time;
Titlescreen titlescreen;
userInterface UI;


void setup()
{
  size(800,600);
  frameRate(60);
  time = new Time();
  titlescreen = new Titlescreen(width/2);
  UI = new userInterface();
  UI.zombies.updateZombieProx();
}

void draw()
{
  time.startTimer(); 
  
  if(titlescreen.endTitlescreen == false){
    titlescreen.display();
  }
   else{
    UI.display();
   }
}

void mousePressed()
{
  if(titlescreen.endTitlescreen == false){
    titlescreen.menuInteractions();  
  }
  else{
    if(UI.player.attackMenu == false) { 
    UI.i_menu.menuInteractions();
    }
    else
    {
       UI.i_menu.attackMenu(); 
    }
  }
}


