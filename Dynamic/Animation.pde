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
  float sortedState[] = new float[128];
  
  // Sorting Step Function
  void sortStep(){
    int a = 0; int b = 0;
  }

  // Number of wall slats
  int wallLength = 128;
  
  
  boolean isSorted(float array[]) { // Returns true if it's sorted
    if(array == sortedState){
      return true;
    }
    return false;
  }
  
  void createWorstCase(){
    for(int i=1; i< 128; i=i+2){
      state[i] = 1.00 - ((float)(i-1))/128;   
    }
    
    for(int i=0; i< 128; i=i+2){
      state[i] = 1.00 - ((float)i)/128;   
    }
    sortedState = Arrays.copyOf(state, state.length); 
    Arrays.sort(sortedState);

    System.out.println(Arrays.toString(state));
  }
  
  // The setup block runs at the beginning of the animation. You could
  // also use this function to initialize variables, load data, etc.
  void setup() {
    createWorstCase();
    System.out.println("This is " + isSorted(state));
    
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