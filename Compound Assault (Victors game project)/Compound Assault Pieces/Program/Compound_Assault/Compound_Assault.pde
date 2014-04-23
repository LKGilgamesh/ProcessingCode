/*
Class purpose:
------------------------------------------------------------------------------------
This class is primarily responsible for generating the tooltip that will be displayed
at the bottom of the UserInterface. The tooltip will display text relevant to what the
player should do next.

Implementation:
------------------------------------------------------------------------------------
Drawing the tooltip using rect(~,~,~,~) and displaying text. Perhaps an idea to change
this to an image based system can be implemented as well. */

//Imports Audio Files
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Variable Declaration
Time time;
UserInterface UI;
Titlescreen titlescreen;

//Main Function
void setup(){
frameRate(60);
size(950,500);
background(100);
 
//Set Variables;
time = new Time();
UI = new UserInterface();
UI.b_window.m_fog[0][0].fog_enable = false;
UI.b_window.m_fog[5][0].fog_enable = false; 
UI.b_window.m_fog[0][3].fog_enable = false; 
UI.b_window.m_fog[5][3].fog_enable = false; 
UI.b_window.m_fog[2][0].fog_enable = false; 
UI.b_window.m_fog[3][0].fog_enable = false; 
titlescreen = new Titlescreen(true);
}

//Set's Phases
void draw(){
  background(100);
  titlescreen.updateTitleScreen();
  
  titlescreen.beginGame();
  time.startTimer();
  //UI.drawUI();

}

//Logic for mouse clicks
void mousePressed(){
 UI.b_window.showTile();
  titlescreen.menuInteraction();
  UI.s_window.menuInteraction();
  UI.s_window.finishSelect();
}

