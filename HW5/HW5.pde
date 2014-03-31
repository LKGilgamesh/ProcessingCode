PImage Shibe;
int x;
Shibe = loadImage("Shiba Inu.jpg");
size(500,500); 
//loadPixels();
//image(Shibe,0,0);

background(0);
textSize(10);

String mw ="M uch text   very wow";
String vw ="Very wow";
for(int j = 10;j <height;j+=15){
  for(int i = int(random(-100,0));i < width;i+= 110){
      for(int k = 0; k < mw.length(); k++){
        println((i+7+(5*k))*(j+1));
        fill(Shibe.pixels[(i+7+(5*k))+ 500*(j)]);

        text(mw.charAt(k),(i+7+(5*k)),j);
    }
  }
}
//updatePixels();


