

class Titlescreen
{
  boolean On = true;
  PImage screenImage;
  float x;
  float y;

  //Constructor
  Titlescreen(boolean On)
  {
    this.On = On;
    screenImage = loadImage("Compound Assault Titlescreen.PNG");
    x = 0;
    y = 0;
  }
    
  int startColX = 325;
  int endColX = 615;
  int startColY = 264;
  int endColY = 314;


//This is the title menu that is constantly updated through the draw function of Compound_Assault.
//The highlighted menu is the result of this function.
    void updateTitleScreen()
    {
      if(On)
      {
        image(screenImage,x,y);
        fill(0,200,0);
        rect(325,250,290,230,10);
      
        //This is sloppy, i should reorganize this when i get the chance, probably put it into an array.
        if(mouseX > startColX && mouseX < endColX && mouseY > startColY && mouseY < endColY)
        {
          fill(0,255,0);
          rectMode(CORNER);
          rect(startColX, startColY, endColX-startColX ,endColY-startColY,10);
             
        }
        else if(mouseX > startColX && mouseX < endColX && mouseY > startColY + 50 && mouseY < endColY + 50)
        {
          fill(0,255,0);
          rect(startColX, startColY + 50, endColX-startColX ,endColY-startColY,10);
        }
        else if(mouseX > startColX && mouseX < endColX && mouseY > startColY + 100 && mouseY < endColY + 100)
        {
          fill(0,255,0);
          rect(startColX, startColY + 100, endColX-startColX ,endColY-startColY,10);
        }
        else if(mouseX > startColX && mouseX < endColX && mouseY > startColY + 150 && mouseY < endColY + 150)
        {
          fill(0,255,0);
          rect(startColX, startColY + 150, endColX-startColX ,endColY-startColY,10);
        }
      
      
          fill(0,0,0);
          textAlign(CENTER);
        
          textSize(50);
          text("Compound Assault",470,150);
        
          textSize(32);
          text("Start game",470,300);
          text("Load game",470,350);
          text("Instructions",470,400);
          text("Quit", 470, 450);   
      }
    }
    
//The ability to click the menus is a result of this function.
    void menuInteraction()
    {
      if(On)
      {
          if(mouseX > startColX && mouseX < endColX && mouseY > startColY && mouseY < endColY)
          {
            println("start button works");
             On = false;
          }
          else if(mouseX > startColX && mouseX < endColX && mouseY > startColY + 50 && mouseY < endColY + 50)
          {
            println("load button works");
          }
          else if(mouseX > startColX && mouseX < endColX && mouseY > startColY + 100 && mouseY < endColY + 100)
          {
            println("Introduction works");
          }
           else if(mouseX > startColX && mouseX < endColX && mouseY > startColY + 150 && mouseY < endColY + 150)
          {
            println("quit works");
            exit();
          }  
      }  
    }
  void beginGame()
  {
    if(On == false)
    {
      UI.drawUI(); 
    }
  }

}
