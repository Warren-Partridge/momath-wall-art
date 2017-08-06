public static class Animation extends WallAnimation {
  // HEY READ THIS PLZ
  // SERIOUSLY
  // So this file is actually our old Fibonacci file. We have renamed it
  // to Animation because we think that might fix the problem with
  // streaming to the wall.
  // So again, THIS IS FIBONACCI

  
  // First, we add metadata to be used in the MoMath system. Change these
  // strings for your behavior.
  String behaviorName = "Example Dynamic Wall Behavior";
  String author = "MoMath";
  String description = "Simple forward-backward behavior.";


  // Now we initialize a few helpful global variables.
  boolean forward = true;
  float step = 0.0003;
  float loc = 0;
  int framecap = 0;
  //float i = 0;
  // initialize state array

  

  // Number of wall slats
  int wallLength = 128;
  int array1[] = new int[32];
  int array2[] = new int[32];
 
    void arrayAdd(int[] array1, int[] array2) {
      boolean carry = false;
      int[] arrayT = new int[32];
      for (int i = 0; i < array1.length; i++){
        arrayT[i] = array1[i];
        array1[i] = array2[i];
        if(arrayT[i] == 0 && array1[i]  == 0){
          if (carry == true){
            array2[i] = 1;
            carry = false;
          }
          else{
            array2[i] = 0;
          }
        }
        else if (arrayT[i] != array1[i]){
          if (carry == true){
            array2[i] = 0;
          }
          else{
            array2[i] = 1;
          }
        }
        else if (arrayT[i] == 1 && array1[i] == 1){
          if (carry == true){
            array2[i] = 1;
          }
          else{
            array2[i] = 0;
            carry = true;
          }
        }
      }
    }
  

  // also use this function to initialize variables, load data, etc.
  void setup() {
  
    array2[0] = 1; 
    updateSlat();
    
    System.out.println(Arrays.toString(array1));
    System.out.println(Arrays.toString(array2));
  }
       
       
  void time(float seconds) {
        float miliseconds = seconds * 1000;
        float startTime = pApplet.millis();
        while (pApplet.millis() <= startTime + miliseconds) {}
    }
    

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update() {
    //time(0.33); // Changes the frames per second in a way
    if (array2[31] == 1) { //It's Finished
      
      System.out.println(Arrays.toString(array1));
      System.out.println("FIBONACCI COMPLETE");
      //[1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0]
      //4205301430
    } else if (framecap%6 == 0) {
/*=======
      array1 = new int[32];
      array2 = new int[32];      
      //[1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0]
      //4205301430
      array2[0] = 1;
      updateSlat();
      time(1); //Comment out to go continuously
      
      System.out.println(Arrays.toString(array1));
      System.out.println(Arrays.toString(array2));
    } 
    else {
>>>>>>> origin/master*/
      // State Change
      arrayAdd(array1, array2);
    
      // State to Wall
      for (int j = 0; j < 128; j=j+4){
        for(int i=j; i<j+4; i++){
          wall.slats[i].setBottom(array1[j/4]);
          wall.slats[i].setTop(array1[j/4]); 
        }
      }
      framecap++;
    } else {
      framecap++;
      System.out.println("Hanging frame " + framecap%6 + "/" + 6);
/*=======
      updateSlat();
    //System.out.println(Arrays.toString(state));
    //// Terminate State
>>>>>>> origin/master*/
    }
    //System.out.println(Arrays.toString(array1));
  }

  // Leave this function blank
  void exit() {
  }
  
  
  void updateSlat() {
      for (int j = 0; j < 128; j=j+4){
        for(int i=j; i<j+4; i++){
          wall.slats[i].setBottom(array1[j/4]);
          wall.slats[i].setTop(array1[j/4]); 
        }
      }
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