import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer[] player;
Time time;
Titlescreen titlescreen;
userInterface UI;
Music music;
Save save;
Load load;
Instructions instructions;

void setup()
{
  minim = new Minim(this);
  player = new AudioPlayer[2];
  size(800,600);
  frameRate(60);
  time = new Time();
  titlescreen = new Titlescreen(width/2);
  UI = new userInterface();
  UI.zombies.updateZombieProx();
  music = new Music();
  save = new Save();
  load = new Load();
  instructions = new Instructions();
  
}
void draw()
{
  
  time.startTimer(); 
  
  if(titlescreen.endTitlescreen == false && titlescreen.loadEndTitlescreen == false){
    if(instructions.displayI)
      instructions.display();
    else
      titlescreen.display();
    
    music.stopGameTheme();
    music.playTitleTheme();
  }
   else if(titlescreen.endTitlescreen == true){
    music.stopTitleTheme();
    music.playGameTheme();
    UI.display();
    
   }
   else if (titlescreen.loadEndTitlescreen == true){
    music.stopTitleTheme();
    music.playGameTheme();
    UI.display();

   }
}

void mousePressed()
{

  if(titlescreen.endTitlescreen == false && titlescreen.loadEndTitlescreen == false){
    if(instructions.displayI){
      instructions.menuInteractions();
    }
    else
      titlescreen.menuInteractions();  
  }
  else if(titlescreen.endTitlescreen == true || titlescreen.loadEndTitlescreen == true){
    if(UI.player.xPos == 500 && UI.player.yPos == 300){
      UI.w_screen.menuInteractions();
    }
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


