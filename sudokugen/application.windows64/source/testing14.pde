import controlP5.*; //<>// //<>//

ControlP5 cp5;
int moeilijkheid = 20;



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
  noStroke();
  cp5 = new ControlP5(this);
  cp5.addSlider("moeilijkheid")
    .setPosition(30, 525)
    .setSize(400, 25) 
    .setRange(0, 52)
    .setNumberOfTickMarks(53)
    .setSliderMode(Slider.FLEXIBLE)
    .showTickMarks(false)
    ;
  new MyButton(cp5, "Start/Restart").setPosition(220, 600);


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
  strokeWeight(2);
  for (int i=0; i < numx.length; i++) {
    rect(numx[i], numy[0], num, num);
    rect(numx[i], numy[1], num, num);
    rect(numx[i], numy[2], num, num);
    rect(numx[i], numy[3], num, num);
    rect(numx[i], numy[4], num, num);
    rect(numx[i], numy[5], num, num);
    rect(numx[i], numy[6], num, num);
    rect(numx[i], numy[7], num, num);
    rect(numx[i], numy[8], num, num);
    // x-as fills with elements out of numx, repeat 9x with elements of array numy
    // value i starts on 0 and will repeat plus one till the last element of the array from numx
  }

  // number placement (text)
  // alle nums [i] kan je veranderen pechie
  fill(text);
  for (int i=0; i < nums.length; i++) {
    text(horizontaal1[i], numx[i]+m/1.3, numy[1]-m/1.5);
    text(horizontaal2[i], numx[i]+m/1.3, numy[2]-m/1.5);
    text(horizontaal3[i], numx[i]+m/1.3, numy[3]-m/1.5);
    text(horizontaal4[i], numx[i]+m/1.3, numy[4]-m/1.5);
    text(horizontaal5[i], numx[i]+m/1.3, numy[5]-m/1.5);
    text(horizontaal6[i], numx[i]+m/1.3, numy[6]-m/1.5);
    text(horizontaal7[i], numx[i]+m/1.3, numy[7]-m/1.5);
    text(horizontaal8[i], numx[i]+m/1.3, numy[8]-m/1.5);
    text(horizontaal9[i], numx[i]+m/1.3, numy[9]-m/1.5);
  }
  
  //wanneer de startknop word ingedrukt dan zal de sudoku gegenereerd worden.
  if (g==0) {
    while (g<2) { 
      deleteSud(81);
      setupSud();
      printSud();
      deleteSud(moeilijkheid);
      printSud();
      g= checkUniqueSud();
      println(g);
      printSud();
      if (g<2) {   
        deleteSud(81);
      }
    }
    if (g==2) {
      println("klaar" );
    }
  }
}