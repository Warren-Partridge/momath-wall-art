public static class Animation extends WallAnimation {

  
  // First, we add metadata to be used in the MoMath system. Change these
  // strings for your behavior.
  String behaviorName = "Example Dynamic Wall Behavior";
  String author = "MoMath";
  String description = "Simple forward-backward behavior.";


  // Now we initialize a few helpful global variables.
  boolean forward = true;
  float step = 0.0003;
  float loc = 0;
  float i = 0;
  float state[] = new float[128];
  
  // Sorting Step Function
  void sortStep(){
    
  }

  // Number of wall slats
  int wallLength = 128;
  
  // The setup block runs at the beginning of the animation. You could
  // also use this function to initialize variables, load data, etc.
  void setup() {
    for (DWSlat slat : wall.slats){
      state[(int) i] = (64-(i%64))/64;
      slat.setBottom((64-(i%64))/64);
      slat.setTop(0);
      i++;
    }
  }
  		 

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update() {
    // State Change
    
    // State to Wall
    for (int j = 0; j < 128; j++){
        wall.slats[j].setBottom(state[j]); 
    }
    // Terminate State
  }

  // Leave this function blank
  void exit() {
  }
  
  // You can ignore everything from here.
  String getBehaviorName() {
    return behaviorName;
  }
  
  String getAuthorName() {
    return author;
  }
  
  String getDescription() {
    return description;
  }
  
}