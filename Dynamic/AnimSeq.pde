public static class AnimSeq extends WallAnimation {

    // First, we add metadata to be used in the MoMath system. Change these
    // strings for your behavior.
    String behaviorName = "Sequences";
    String author = "Team";
    String description = "Slideshow of different Sequences";


    // Now we initialize a few helpful global variables.
    boolean forward = true;
    float i = 0;
    // initialize state array
    float state[] = new float[128];
    float sortedState[] = new float[128];
    int selectionI = 0;
    int index = 0; //Change to 2 to start at bubble, 4 for insert



    // Number of wall slats
    int wallLength = 128;


    boolean isSorted() { // Returns true if it's sorted
        if (Arrays.equals(state, sortedState)) {
            return true;
        }
        return false;
    }

    // Setup the wall
    void createWorstCase() {
        for (int i = 1; i < 128; i = i + 2) {
            state[i] = 1.00 - ((float)(i - 1)) / 128;
        }

        for (int i = 0; i < 128; i = i + 2) {
            state[i] = 1.00 - ((float) i) / 128;
        }
        sortedState = Arrays.copyOf(state, state.length);
        Arrays.sort(sortedState);


        System.out.println(Arrays.toString(state));
    }

    void createRandomCase() {
        for (int i = 1; i < 128; i++) {
            int value = ThreadLocalRandom.current().nextInt(0, 128 + 1);
            state[i] = ((float) value) / 128.00;
        }
        sortedState = Arrays.copyOf(state, state.length);
        Arrays.sort(sortedState);
        System.out.println(Arrays.toString(state));
    }

    // The setup block runs at the beginning of the animation. You could
    // also use this function to initialize variables, load data, etc.
    void setup() {
        createRandomCase();
        updateSlat();
    }
    

    

    // The update block will be repeated for each frame. This is where the
    // action should be programmed.
    void update() {
      
      //Selection Sort
      if(index==0){
        if(!isSorted()){
          selectionStep();
          
        } else {
          time(3);
          index +=1;
          createRandomCase();
        }
        updateSlat();
      }
      
      //Bubble Sort
      else if(index==1){
        if(!isSorted()){
          bubbleStep();
        } else {
          System.out.println("Wait");
          time(5);
          index +=1;
          createRandomCase();
          time(2);
        }
        updateSlat();
      }
      
      //Insert Sort
      else if(index==2){
        if(!isSorted()){
          insertStep();
        } else {
          System.out.println("Wait");
          time(5);
          index =0;
          createRandomCase();
          time(4);
        }
        updateSlat();
      }

      else if(index==3){
        if(!isSorted()){
          quickStep();
        } else {
          System.out.println("Wait");
          time(5);
          index =0;
          createRandomCase();
          time(4);
        }
        updateSlat();
      }
    }
    
    void quickStep(){
      
    }
    void time(int seconds) {
            int miliseconds = seconds * 1000;
            float startTime = pApplet.millis();
            while (pApplet.millis() <= startTime + miliseconds) {}
        }
        // Leave this function blank
    void exit() {}


    static int[] fib(int n) {
        int[] feb = new int[n];
        feb[0] = 0;
        feb[1] = 1;


        for (int i = 2; i < n; i++) {
            feb[i] = feb[i - 1] + feb[i - 2];
            System.out.print(feb[i] + " ");
        }

        return feb;
    }

    void updateSlat() {
            for (int j = 0; j < 128; j++) {
                wall.slats[j].setBottom(state[j]);
                wall.slats[j].setTop(1-state[j]);
            }
        }
        // Selection sort step function
    void selectionStep() {
        int min_index = selectionI;
        for (int j = selectionI + 1; j < 128; j++) {
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
        
        //This will speed up the process
        for (int i = selectionI; i < 127; i++) {
            int counter = 0;
            if (state[i] > state[i + 1]) {
                swap(i, i + 1);
                
                if(counter==1){
                  break;
                }
                counter++;
                
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
    
    // Insertion sort
    
    void insertStep(){
        //This will speed up the process
        for (int i = 0; i < selectionI; i++) {
            int counter = 0;
            if (state[i] > state[i + 1]) {
                swap(i, i + 1);
                
                if(counter==1){ //Changing this value speeds up the process
                  break;
                }
                counter++;
                
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
        //System.out.println("SWAP OCCURRED: " + state[x] + " and " + state[y]);
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