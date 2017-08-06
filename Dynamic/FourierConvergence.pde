public static class AnimFourier extends WallAnimation {
  
  
  // First, we add metadata to be used in the MoMath system. Change these
  // strings for your behavior.
  String behaviorName = "Example Dynamic Wall Behavior";
  String author = "MoMath";
  String description = "Simple forward-backward behavior.";


  // Now we initialize a few helpful global variables.
  int max = 101;
  int n = 1;
  double image[] = new double[128];
  int framecap = 0;
  
  // Square wave Fourier Series: 4/pi * sum_odd(sin(n*pi*x/L)
  // L = 1
  
  void fSeries(int n){
    for (int i = 0; i < 128; i++){
       image[i]+= 0.7*(2/(n*Math.PI) * Math.sin(Math.PI * 2 * n*(i+1)/128));
    }
  }
  
  // Number of wall slats
  int wallLength = 128;
  
  // The setup block runs at the beginning of the animation. You could
  // also use this function to initialize variables, load data, etc.
  void setup() {
  // initialize domain
    for (int i = 0; i < 128; i++){
      image[i] = 1/2 + 0.7* (2/Math.PI * Math.sin(Math.PI* (i+1)/128));
    }
    for (int i = 0; i<128; i++){
      wall.slats[i].setBottom((float) image[i]);
      wall.slats[i].setTop((float) image[i]);
    }
  }
       

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update() {
    // Check for Terminal State
    if (n == max){
      System.out.println("Done");
    }
    // State Change
    else if (framecap%6 == 0){
      
      n+=2;
      fSeries(n);
      // State to Wall
      for (int i = 0; i<128; i++){
        wall.slats[i].setBottom((float) image[i]);
        wall.slats[i].setTop((float) image[i]);
      }
      framecap ++;
    }
    else{
      framecap ++; 
    }
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