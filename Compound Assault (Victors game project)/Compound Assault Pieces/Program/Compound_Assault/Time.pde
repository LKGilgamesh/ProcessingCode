/*
Class purpose:
------------------------------------------------------------------------------------
A general implementation to most games.

Implementation:
------------------------------------------------------------------------------------
A constantly increasing variable t increasing at rate t_a.
-Functions:
-startTimer
-restartTimer                     */

class Time
{
  //Member variables
  float t;
  float t_a;
  boolean t_reach;
  
 //Constructor   
  Time(){
  t= 0.0;
  t_a = frameRate/1000;
  }
  
  //Member functions
  void startTimer(){
     t+= t_a;    
  }
  
  void restartTimer(){
    t = 0.0;
  }    
}
