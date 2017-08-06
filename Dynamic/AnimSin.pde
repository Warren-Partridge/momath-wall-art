public static class AnimSin extends WallAnimation {


  
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
  int index = 0;
  //float i = 0;
  // initialize state array

  

  // Number of wall slats
  int wallLength = 128;
  float state[] = new float[128];

 
  // also use this function to initialize variables, load data, etc.
  void setup() {
  
    for (int i = 0; i < 128; i=i+2){
        //ODD
        
        //float value = (float)Math.sin((i/128) * PI) ;
        float value = 0.5 * (float)Math.sin((float)i/32.00 * PI) + 0.5 ;
        System.out.println(i + " " + value);
        state[i] = value;
    }
    updateSlat();
    

  }
       
       
  void time(float seconds) {
        float miliseconds = seconds * 1000;
        float startTime = pApplet.millis();
        while (pApplet.millis() <= startTime + miliseconds) {}
    }
    

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update() {
      for (int i = 0; i < 128; i=i+2){
        //float value = (float)Math.sin((i/128) * PI) ;
        float value = 0.5 * (float)Math.sin((float)(i+index)/32.00 * PI) + 0.5 ;
        
        state[i] = value;
      }
      index +=1;
      updateSlat();

      
      System.out.println(Arrays.toString(state));
      

  }

  // Leave this function blank
  void exit() {
  }
  
  
  void updateSlat() {
      for (int i = 0; i < 128; i=i+2){
        //ODD
        wall.slats[i].setBottom(state[i]);
        wall.slats[i].setTop(state[i]);
        
        //Even
        wall.slats[i+1].setBottom(0);
        wall.slats[i+1].setTop(1); 
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