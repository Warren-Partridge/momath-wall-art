public static class FourierConvergence extends WallAnimation {
  
  
  // First, we add metadata to be used in the MoMath system. Change these
  // strings for your behavior.
  String behaviorName = "Example Dynamic Wall Behavior";
  String author = "MoMath";
  String description = "Simple forward-backward behavior.";


  // Now we initialize a few helpful global variables.
  int max = 31;
  int n = 1;
  int periods = 4;
  double domain[] = new double[64];
  double image[] = new double[64];
  double constant[] = new double[64];
  int framecap = 0;
  int framerate = 6;

  
  // Crease stuff
  // Constants:
  
  double h = 11;
  
  // slab calculators
  
  double fLower(double c){
    if (c == 0){
      return 0;
    }
    return (h-c)/h; 
  }
  
  double fHigher(double c){
    return (h-c)/h;
  }
  // Square wave Fourier Series: 4/pi * sum_odd(sin(n*pi*x/L)
  // L = 1
  
  void fSeries(int n){
    for (int i = 0; i < 64; i++){
       image[i]+= 0.75*h*(2/(n*Math.PI) * Math.sin(periods*2*Math.PI * n*domain[i]));
    }
    System.out.println(image[32]);
  }
  
  // Number of wall slats
  int wallLength = 128;
  
  // The setup block runs at the beginning of the animation. You could
  // also use this function to initialize variables, load data, etc.
  void setup() {
    // setup the arrays:
    for (int i = 0; i < 64; i++){
      constant[i] = 0.5;
      domain[i] = 4 * 2 * Math.PI * (i+1)/64;
      image[i] = h/2;
    }
    // setup the initial state
    for (int j = 0; j < 128; j++){
        wall.slats[j].setBottom(1);
        wall.slats[j].setTop(0);
    }
  }
       

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update() {
    // Check for Terminal State
    if (n == max){
      for (int i = 0; i < 64; i++){
        image[i] = h/2;
      }
      // setup the initial state
      for (int j = 0; j < 128; j++){
          wall.slats[j].setBottom(1);
          wall.slats[j].setTop(0);
      }
      n = 1;
    }
    // State Change
    else if (framecap%framerate == 0){
      System.out.println("Changing State ");
      fSeries(n);
      n+=2;
      // State to Wall
      for (int i = 0; i<128; i++){
        // if i is odd do nothing
        if (i%2 == 1){
        
        }
        else{
          // if image[i] > h/2
          if (image[i/2] > h || image[i/2] < 0){
            System.out.println("ERROR");
          }
          else if (image[i/2] >= h/2){
            wall.slats[i].setBottom((float) fHigher(image[i/2]));
            wall.slats[i].setTop((float) fHigher(image[i/2]));
         //   System.out.println(fHigher(image[i/2]));
          }
          else{
            wall.slats[i].setBottom((float) fLower(image[i/2]));
            wall.slats[i].setTop((float) fLower(image[i/2]));
          }
        }
      }
      framecap ++;
    }
    else{
      System.out.println("Hanging frame " + framecap%framerate + "/" + framerate);
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