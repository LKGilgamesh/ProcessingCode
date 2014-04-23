PFont myFont;
Table myTable;

void setup(){
  size(500,500);
  textAlign(CENTER);
  myFont = createFont("Kinnari", 20);
  myTable = loadTable("data.csv", "header");
  textFont(myFont);
}

void draw(){
  background(0);
  for(TableRow row : myTable.rows()){
    String word = row.getString("word");
    int x = row.getInt("x");
    int y = row.getInt("y");
    int r = row.getInt("r");
    int g = row.getInt("g");
    int b = row.getInt("b");
    int a = row.getInt("a");
    fill(r,g,b,a);
    text(word,x,y);

  }
  for(int i = 0;i<1;i++){
      //saveFrame();
  }
}

