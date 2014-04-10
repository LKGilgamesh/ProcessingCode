

Time time;
Titlescreen titlescreen;
userInterface UI;
Music music;

void setup()
{
  
  size(800,600);
  frameRate(60);
  time = new Time();
  titlescreen = new Titlescreen(width/2);
  UI = new userInterface();
  UI.zombies.updateZombieProx();
  music = new Music();
  music.playTitleTheme();
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
    if(UI.player.health > 0){
      if(UI.player.attackMenu == false) { 
        UI.i_menu.menuInteractions();
      }
      else{
         UI.csystem.menuInteractions(); 
      }
    }
    if(UI.player.health <= 0){
      UI.gameover.menuInteractions();
    }
  }
}


