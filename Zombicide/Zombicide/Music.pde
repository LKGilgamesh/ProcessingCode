import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

class Music{
  Minim minim;
  AudioPlayer[] player;
  
  Music(){
    minim = new Minim(this);
    player = new AudioPlayer[2];
    player[0] = minim.loadFile("TitleTheme.mp3");
    player[1] = minim.loadFile("GameTheme.mp3");

  }
  void playTitleTheme(){
    player[0].loop();
  }
  void stopTitleTheme(){
    player[0].rewind();
    player[0].pause();
  }
  void playGameTheme(){
    player[1].loop(); 
  }
  void stopGameTheme(){
    player[1].rewind();
    player[1].pause(); 
  }
}
