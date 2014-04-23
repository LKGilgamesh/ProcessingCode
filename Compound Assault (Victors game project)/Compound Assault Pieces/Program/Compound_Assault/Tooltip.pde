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

class Tooltip{
//Member Variables
float x;
float y;
String line1;
String line2;

//Constructor
Tooltip(float x, float y){
this.x = x;
this.y = y;
line1 = "Example text in line 1: The length can only extend to this far lorem ipsum cats dogs catdos";
line2 = "Example text in line 2: This would be considered the maximum tooltip text fdasfasdfa fdas ";
}

//Member Functions
void display(){
fill(0);
stroke(176,255,134);
rect(x,y,596,99);
noStroke();

textSize(20);

fill(176,255,134);
textAlign(LEFT);
text(line1,x+20,y+27);
text(line2,x+20,y+55);
}

void change(String line1, String line2){
this.line1= line1;
this.line2= line2;
}

}
