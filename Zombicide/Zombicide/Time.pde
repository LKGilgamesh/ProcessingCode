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
