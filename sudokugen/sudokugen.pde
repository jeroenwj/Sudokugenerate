import controlP5.*; //<>//

ControlP5 cp5;
int moeilijkheid = 62;
int antwoord = 0;



int recall;
int bevatniet;
int bevatwel;
//waarde van het gestal zelf, nummer x array, nummer y array, nummer "z" array
int[] queuex = new int[81];
boolean resetx = false;
int[] queuey = new int[81];
boolean resety = false;
int[] queuez = new int[81];
boolean resetz =false;
int[] rfout = new int[81];
int[] terugcheck = new int[2];
int overallfout=0;
int resetgetal=27;



boolean klaar = false;
int g = 2;


void setup() {

  //Dit stukje word gebruikt om een slider aan te maken.

  cp5 = new ControlP5(this);
  cp5.addSlider("moeilijkheid")
    .setPosition(30, 525)
    .setSize(400, 25) 
    .setRange(4, 64)
    .setNumberOfTickMarks(60)
    .setSliderMode(Slider.FLEXIBLE)
    .showTickMarks(false)
    ;
    cp5.addSlider("antwoord")
    .setPosition(497-75, 575)
    .setSize(25, 25) 
    .setRange(0, 1)
    .setNumberOfTickMarks(2)
    .setSliderMode(Slider.FLEXIBLE)
    .showTickMarks(false)
    ;
  new MyButton(cp5, "Generate").setPosition(220, 575);


  size(497, 700);
  textSize(20);
}


int num = 55;
int m = num/2;
int [] numx = {0, num, 2*num, 3*num, 4*num, 5*num, 6*num, 7*num, 8*num};
int [] numy = {0, num, 2*num, 3*num, 4*num, 5*num, 6*num, 7*num, 8*num, 9*num};

color sudoku= color(100, 149, 237);      // blauw
color backgr= color(244, 143, 177);      // roze
color difficulty= color(244, 208, 63);   // geel
color text = color(60);                  // een tintje zwart
color circle = color(190);               // grijs

String [] nums = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};





void draw () {
  
  background (backgr);

  //sudokuraster (opmaak)
  fill(sudoku);
  rect(0,0,width, 497);
  
  //Hier worden de lijnen van de sudoku geprint op het scherm
  for (int i=1; i < numx.length; i++) {
    if(i%3 ==0){ //elke derde lijn is dikgedrukt.
      strokeWeight(2);
    } else{strokeWeight(1);}  
    line(numx[i]+5,0,numx[i]+5,55*9);
    line(0,numy[i]+5,width,numy[i]+5);
  }

  // number placement (text)
  fill(text);
  if(antwoord==0){ //Wanneer de sudoku geprint moet worden zal de volgende code afspelen:
  for (int i=0; i < nums.length; i++) { //De waardes worden allen geprint als zij gegeven zijn. De rest blijft leeg.
    if (horizontaal1[i] != 0){text(horizontaal1[i], numx[i]+m/1.3, numy[1]-m/1.5);}
    if (horizontaal2[i] != 0){text(horizontaal2[i], numx[i]+m/1.3, numy[2]-m/1.5);}
    if (horizontaal3[i] != 0){text(horizontaal3[i], numx[i]+m/1.3, numy[3]-m/1.5);}
    if (horizontaal4[i] != 0){text(horizontaal4[i], numx[i]+m/1.3, numy[4]-m/1.5);}
    if (horizontaal5[i] != 0){text(horizontaal5[i], numx[i]+m/1.3, numy[5]-m/1.5);}
    if (horizontaal6[i] != 0){text(horizontaal6[i], numx[i]+m/1.3, numy[6]-m/1.5);}
    if (horizontaal7[i] != 0){text(horizontaal7[i], numx[i]+m/1.3, numy[7]-m/1.5);}
    if (horizontaal8[i] != 0){text(horizontaal8[i], numx[i]+m/1.3, numy[8]-m/1.5);}
    if (horizontaal9[i] != 0){text(horizontaal9[i], numx[i]+m/1.3, numy[9]-m/1.5);}
  }
  }else 
  { //Wanneer het antwoord geprint moet worden zal de volgende code doorlopen woorden.
    for (int i=0; i < 9; i++) { //Seze code print het antwoord van de sudoku.
      text(antwoordt[i], numx[i%9]+m/1.3, numy[1]-m/1.5);
      text(antwoordt[i+9], numx[i%9]+m/1.3, numy[2]-m/1.5);
      text(antwoordt[i+18], numx[i%9]+m/1.3, numy[3]-m/1.5);
      text(antwoordt[i+27], numx[i%9]+m/1.3, numy[4]-m/1.5);
      text(antwoordt[i+36], numx[i%9]+m/1.3, numy[5]-m/1.5);
      text(antwoordt[i+45], numx[i%9]+m/1.3, numy[6]-m/1.5);
      text(antwoordt[i+54], numx[i%9]+m/1.3, numy[7]-m/1.5);
      text(antwoordt[i+63], numx[i%9]+m/1.3, numy[8]-m/1.5);
      text(antwoordt[i+72], numx[i%9]+m/1.3, numy[9]-m/1.5);

    }
    
  }
  
  //wanneer de startknop word ingedrukt dan zal de sudoku gegenereerd worden.
  if (g==0) {
    while (g<2) {
      background(0);
      deleteSud(81);
      setupSud();
      printSud();
      deleteSud(moeilijkheid);
      printSud();
      g= checkUniqueSud();      
      if (g<2) {   
        deleteSud(81);
      }
    }
    if (g==2) {
      println("klaar" );
    }
  }
}