class Load{
 int xPos, yPos, moves, health, level;
 boolean hasKey;
 JSONArray values;
 ArrayList<Integer> zXPos;
 ArrayList<Integer> zYPos;
 Load(){
   xPos = 0;
   yPos = 0;
   moves = 0;
   health = 0;
   level = 0;
   hasKey = false;
   zXPos = new ArrayList<Integer>();
   zYPos = new ArrayList<Integer>();
 } 
 void loadGame(){
  values = loadJSONArray("new.json");
  if(values.size() > 0){
    JSONObject player = values.getJSONObject(0);
    xPos = player.getInt("xPos");
    yPos = player.getInt("yPos");
    moves = player.getInt("moves");
    health = player.getInt("health");
    level = player.getInt("level");
    hasKey = player.getBoolean("hasKey");
  }    
  if(values.size() > 1){
    for(int i = 1; i < values.size(); i++){
      JSONObject zombie = values.getJSONObject(i);
      zXPos.add(zombie.getInt("xPos"));
      zYPos.add(zombie.getInt("yPos"));
    }
  }
  UI.player.xPos = xPos;
  UI.player.yPos = yPos;
  UI.player.moves = moves;
  UI.player.health = health;
  UI.player.level = level;
  
  UI.zombies.zombiesArr.clear();
  for(int i = 0;i < zYPos.size();i++){
    UI.zombies.addZombie(zXPos.get(i),zYPos.get(i));
  }
 }
}
