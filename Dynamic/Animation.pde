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
  // initialize state array
  float state[] = new float[128];
  float sortedState[] = new float[128];
  int selectionI = 0;
  
  // Sorting Step Function
  void sortStep(){
    
  }

  // Number of wall slats
  int wallLength = 128;
  
  
  boolean isSorted() { // Returns true if it's sorted
    if(Arrays.equals(state, sortedState)){
      return true;
    }
    return false;
  }
  
  // Setup the wall
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
  
  void createRandomCase(){
     for(int i=1; i< 128; i++){
      int value = ThreadLocalRandom.current().nextInt(0, 128 + 1);
      state[i] = ((float)value)/128.00;
    }
    
    sortedState = Arrays.copyOf(state, state.length); 
    Arrays.sort(sortedState);
    System.out.println(Arrays.toString(state));
  }
  
  // The setup block runs at the beginning of the animation. You could
  // also use this function to initialize variables, load data, etc.
  void setup() {
    createRandomCase();
    System.out.println("This is " + isSorted());
    
    for (DWSlat slat : wall.slats){
      slat.setBottom(state[(int) i]);
      slat.setTop(0);
      i++;
    }
  }
  		 

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update() {
    if (isSorted()) {
      print("This is finished");
      createRandomCase();      
      for (DWSlat slat : wall.slats){
        slat.setBottom(state[(int) i]);
        slat.setTop(0);
        i++;
      }
    } else {
    // State Change
    bubbleStep();
    // State to Wall
    for (int j = 0; j < 128; j++){
        wall.slats[j].setBottom(state[j]);
        wall.slats[j].setTop(state[j]); 
    }
    System.out.println(Arrays.toString(state));
    // Terminate State
  }
  }

  // Leave this function blank
  void exit() {
  }
  
  // Selection sort step function
  void selectionStep() {
      int min_index = selectionI;
      for (int j=selectionI+1; j < 128; j++) {
        if (state[j] < state[min_index]) {
          min_index = j;
        }
      }
      swap(min_index, selectionI);
      if (selectionI >= 127) {
        selectionI = 0;
        return;
      } else {
        selectionI++;
        return;
      }
  }
  
    // Selection sort step function
  void bubbleStep() {
      for(int i=selectionI; i<127;i++){
        if(state[i]>state[i+1]){
          swap(i, i+1);
          break;
        }
      }
      
      if (selectionI >= 127) {
        selectionI = 0;
        return;
      } else {
        selectionI++;
        return;
      }
  }
  
  
  // Swaping function
  void swap(int x, int y) {
    float temp = state[x];
    state[x] = state[y];
    state[y] = temp;
    System.out.println("SWAP OCCURRED: " + state[x] + " and " + state[y]);
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