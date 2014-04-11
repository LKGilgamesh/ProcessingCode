

class Music{

  boolean tmusic;
  boolean gmusic;
  
  Music(){
    tmusic = true;
    gmusic = false;

    player[0] = minim.loadFile("TitleTheme.mp3");
    player[1] = minim.loadFile("GameTheme.mp3");

  }
  void playTitleTheme(){
    if(tmusic){
      player[0].loop();
      tmusic = false;
    }
  }
  void stopTitleTheme(){
    player[0].rewind();
    player[0].pause();
    tmusic = true;
  }
  void playGameTheme(){
    if(gmusic){
      player[1].loop(); 
      gmusic = false;
    }
  }
  void stopGameTheme(){
    player[1].rewind();
    player[1].pause(); 
    gmusic = true;
  }
}
