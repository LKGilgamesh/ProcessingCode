class Save{
  JSONArray values;
  
  Save(){
    values = new JSONArray();
 }
  void saveGame(){
    JSONObject player = new JSONObject();
    player.setInt("xPos", UI.player.xPos);
    player.setInt("yPos", UI.player.yPos);
    player.setInt("moves", UI.player.moves);
    player.setInt("health", UI.player.health);
    player.setInt("level", UI.player.level);
    
    values.setJSONObject(0, player);
    
    if(UI.zombies.zombiesArr.size() != 0){
       for(int i = 1; i < UI.zombies.zombiesArr.size() + 1;i++){
          JSONObject zombie = new JSONObject();
          zombie.setInt("xPos", UI.zombies.zombiesArr.get(i-1).xPos);
          zombie.setInt("yPos", UI.zombies.zombiesArr.get(i-1).yPos);
          
          values.setJSONObject(i, zombie);
       } 
    }
    saveJSONArray(values, "data/new.json");
    println("made it here");
  } 
}
