import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class testing14 extends PApplet {

 //<>// //<>//

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


public void setup() {

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


  
  textSize(20);
}


int num = 55;
int m = num/2;
int [] numx = {0, num, 2*num, 3*num, 4*num, 5*num, 6*num, 7*num, 8*num};
int [] numy = {0, num, 2*num, 3*num, 4*num, 5*num, 6*num, 7*num, 8*num, 9*num};

int sudoku= color(100, 149, 237);      // blauw
int backgr= color(244, 143, 177);      // roze
int difficulty= color(244, 208, 63);   // geel
int text = color(60);                  // een tintje zwart
int circle = color(190);               // grijs

String [] nums = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};





public void draw () {



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
    text(horizontaal1[i], numx[i]+m/1.3f, numy[1]-m/1.5f);
    text(horizontaal2[i], numx[i]+m/1.3f, numy[2]-m/1.5f);
    text(horizontaal3[i], numx[i]+m/1.3f, numy[3]-m/1.5f);
    text(horizontaal4[i], numx[i]+m/1.3f, numy[4]-m/1.5f);
    text(horizontaal5[i], numx[i]+m/1.3f, numy[5]-m/1.5f);
    text(horizontaal6[i], numx[i]+m/1.3f, numy[6]-m/1.5f);
    text(horizontaal7[i], numx[i]+m/1.3f, numy[7]-m/1.5f);
    text(horizontaal8[i], numx[i]+m/1.3f, numy[8]-m/1.5f);
    text(horizontaal9[i], numx[i]+m/1.3f, numy[9]-m/1.5f);
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
int bevatweluny = 0;  //<>//
int bevatnietuny = 0;
int totaleoplossingen = 0;

public int checkUniqueSud() {
  checkUniqueSud1();
  int g = checkUniqueSud3();
  return g;
}

//Hier word nagegaan of het getal in de sudoku al bestaat of verwijderd is.
public void checkUniqueSud1() {
  for (int k=1; k<82; k++) {
    for (int r= 1; r<10; r++)
    {
      identifyXYZ(k);
      int[] ytemp = new int[2];
      ytemp = checkY(k-1%9, r, true ); 
      bevatweluny = ytemp[0];
      bevatnietuny = ytemp[1];
      if (bevatweluny == 1) {
        sallint[k-1]=r;
        sallbool[k-1]=false;
        bevatweluny=0;
        bevatnietuny=0;
        r = 10;
      }
    }
  }
}

//check welke sum aanpassen etc
public int checkUniqueSud3() {
  for (int i = 0; i<82; i++) {

    //kijkt of de waarde veranderd mag woorden
    if (sallbool[i]==true && totaleoplossingen<2) {

      //kijkt of de waarde niet meer dan 10 is
      if (sallint[i]<9) {
        sallint[i]++;

        //kijken of de waarde al in de arrays zitten.
        identifyXYZ(i+1);

        checkX(sallint[i], false);
        checkY(0, sallint[i], false);
        checkZ(sallint[i]); 

        //als de waardes er al in zitten:sla deze dan over en ga verder
        if (bevatwelz >=1 ||bevatwely >=1 || bevatwelx >=1) {

          i--;
          bevatnietx=0;
          bevatniety=0;
          bevatnietz=0;
          bevatwelx=0;
          bevatwely=0;
          bevatwelz=0;
        } else {      
          checkzw(i+1, sallint[i], true);
          checkyw(i+1, sallint[i], true); 
          checkxw(i+1, sallint[i], true);
          bevatnietx=0;
          bevatniety=0;
          bevatnietz=0;
          bevatwelx=0;
          bevatwely=0;
          bevatwelz=0;
        }
      } else {
        sallint[i]=0;
        //wanneer de waarde niet hoger gemaakt kan worden word er gekeken welke waarde er voor nog wel aangepast kan worden.
        for (int j = 1; j<81; j++) {
          if (i-j>-1) {
            if (sallbool[i-j]==true) {   
              identifyXYZ(i+1);
              checkzw(i+1, sallint[i], false);
              checkyw(i+1, sallint[i], false); 
              checkxw(i+1, sallint[i], false);
              i= i-j-1;
              j =82;
            }
          } else 
          {
            j =82;
            i =82;
          }
        }
      }
    } else if (sallbool[i]==false&& i==81) 
    { 
      totaleoplossingen +=1;
      for (int j = 1; j<81; j++) {
        if (sallbool[i-j]==true) {   
          i= i-j-1;
          j=82;
        }
      }
      printSud();
    } else if (totaleoplossingen>1)
    {
      i=82;
      bevatweluny = 0;
      bevatnietuny = 0;
      totaleoplossingen = 0;
      for (int y = 1; y<82; y++) {
        identifyXYZ(y);
        checkzw(y, 0, false);
        checkyw(y, 0, false);  
        checkxw(y, 0, false);
      }
      for (int u = 0; u<82; u++) {
        if (u==81) {
          sallint[u] = 0;
          sallbool[u] = false;
        } else {
          sallint[u] = 0;
          sallbool[u] = true;
        }
      }
      println(" Nieuwe sudoku");
      int g =1;
      return g;
    }
  }
  //als er meer dan 1 oplossing is word de sudoku gereset.
  if (totaleoplossingen >1)
  {
    for (int y = 1; y<82; y++) {
      identifyXYZ(y);
      checkzw(y, 0, false);
      checkyw(y, 0, false);  
      checkxw(y, 0, false);
    }    

    int g =1;   
    for (int u = 0; u<82; u++) {
      if (u==81) {
        sallint[u] = 0;
        sallbool[u] = false;
      } else {
        sallint[u] = 0;
        sallbool[u] = true;
      }
    }
    bevatweluny = 0;
    bevatnietuny = 0;
    totaleoplossingen = 0;
    return g;
  } 

  //als er maar 1 oplossing is word de sudoku goed gekeurd  
  else if (totaleoplossingen ==1) {
    for (int i = 1; i<82; i++) {
      if (sallbool[i-1]==true) {
        identifyXYZ(i);
        checkzw(i, 0, false);
        checkyw(i, 0, false); 
        checkxw(i, 0, false);
      }
    }
    printSud();
    totaleoplossingen =0;
    bevatweluny = 0;
    bevatnietuny = 0;
    totaleoplossingen = 0;
    println("Gsjfkfn");
    int g =2;
    return g;
  }
  bevatweluny = 0;
  bevatnietuny = 0;
  totaleoplossingen = 0;
  int g =1;
  return g;
}
int bevatwelx=0; 
int bevatnietx=0;
int bevatwely=0;
int bevatniety=0;
int bevatwelz=0;
int bevatnietz=0;
int totaalfout=0;
int totaalgedaan=0;
int[] bevastal = new int[8];

public int[] checkWaardes(int x, int y, int z, int r, int i) {  
  totaalgedaan+=1;  

  if(totaalfout>=30){
    i =resetWaardes(i,r);  
  }else {  

  checkX(r, false);  
  checkY(0, r, false);
  checkZ(r); 

 if(bevatwelz >=1 ||bevatwely >=1 || bevatwelx >=1){
    i--;
    bevatnietx=0;
    bevatniety=0;
    bevatnietz=0;
    bevatwelx=0;
    bevatwely=0;
    bevatwelz=0;
    totaalfout+=1;
    overallfout+=1; 
  } 

else if ( (bevatnietx == 9 &&  bevatniety == 9) &&  bevatnietz == 9) {
    bevatnietx=0;
    bevatniety=0;
    bevatnietz=0;
    bevatwelx=0;
    bevatwely=0;
    bevatwelz=0;
    totaalfout=0;
    
    checkzw(i,r,true);
    checkyw(i,r,true); 
    checkxw(i,r,true); 
    
} else {
    bevatnietx=0;
    bevatniety=0;
    bevatnietz=0;
    bevatwelx=0;
    bevatwely=0;
    bevatwelz=0;
    totaalfout=0;
  int[] tempvar = new int[2];
  tempvar[1]=overallfout;
  tempvar[0]=i;
  return tempvar;
}

  
}
 int[] tempvar = new int[2];
 tempvar[1]=overallfout;
  tempvar[0]=i;
  return tempvar;
}
      int xz;
      
      public void checkxw(int i, int r, boolean add){  
       int h;
       
      if(i<9){xz=0;}else if(i<18){xz=1;}else if(i<27){xz=2;}else if(i<36){xz=3;}else if(i<45){xz=4;}else if(i<54){xz=5;}else if(i<63){xz=6;}else if(i<72){xz=7;}else if(i<81){xz=8;}
      
      if (i>9 && i!=18 && i!=27 && i!=36 && i!=45 && i!=54 && i!=63 && i!=72 && i!=81)
      {h=i%9-1;}
      else{h=(i-1)%9;}
      
      int newNumber=i;
      if (add==false){
        r=0;
        newNumber=0;
      }
      
      if (x==1) {verticaal1[h+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==2) {verticaal2[h-1+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==3) {verticaal3[h-2+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==4) {verticaal4[h-3+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==5) {verticaal5[h-4+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==6) {verticaal6[h-5+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==7) {verticaal7[h-6+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==8) {verticaal8[h-7+xz] = r;queuex[i%resetgetal] =newNumber;}
      if (x==9) {verticaal9[h-8+xz] = r;queuex[i%resetgetal] =newNumber;}
      
      }
 public void checkyw(int i, int r,boolean add){  
   int newNumber=i;
   if (add== false){
     r=0;
     newNumber=0;
   }
   
    if (y==1) {  
        horizontaal1[i-1] = r;
        queuex[i%resetgetal] = newNumber;
    }
          
    else if (y==2) {
        horizontaal2[i-9-1] = r; 
        queuex[i%resetgetal] = newNumber;
        }  
    else if (y==3) {
    horizontaal3[i-18-1] = r;
        queuex[i%resetgetal] = newNumber;
        }  
    else if (y==4) {
        horizontaal4[i-27-1] = r;
        queuex[i%resetgetal] = newNumber;  
        }
    else if (y==5) {
    
        horizontaal5[i-36-1] = r;  
        queuex[i%resetgetal] = newNumber;
        }
    else if (y==6) {  
        horizontaal6[i-45-1] = r;
        queuex[i%resetgetal] = newNumber;
        }
    else if (y==7) {  
        horizontaal7[i-54-1] = r;
        queuex[i%resetgetal] = newNumber;
        }  
    else if (y==8) {
    
        horizontaal8[i-63-1] = r;
        queuex[i%resetgetal] = newNumber;
        }
    else if (y==9) {
        horizontaal9[i-72-1] = r;
        queuex[i%resetgetal] = newNumber;}
        
      }
public void checkzw(int i, int r, boolean add){  
  int newNumber= i;
  if(add==false){
  newNumber=0;
  r=0;
  }
  
if(i==1 || i==2 || i==3){  
  
   grid1[i-1] = r;
   queuex[i%resetgetal] = newNumber; 
  
 } else  if(i==10 || i==11 || i==12){
   grid1[i-6-1] = r;
   queuex[i%resetgetal] = newNumber;
 
 }else  if(i==19 || i==20 || i==21){
   grid1[i-12-1] = r;
   queuex[i%resetgetal] = newNumber;
 
 }else 
 
 if(i==4 || i==5 || i==6){
   grid2[i-4] = r;
   queuex[i%resetgetal] = newNumber;} 
    
 else  if(i==13 || i==14 || i==15){
   grid2[i-6-4] = r;
   queuex[i%resetgetal] = newNumber;
   }
   else  if(i==22 || i==23 || i==24){
   grid2[i-12-4] = r;
   queuex[i%resetgetal] = newNumber;
 }
 else 
 
 if(i==7 || i==8 || i==9){
   grid3[i-7] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==16 || i==17 || i==18){
   grid3[i-6-7] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==25 || i==26 || i==27){
   grid3[i-12-7] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else 
 
 if(i==28 || i==29 || i==30){
   
   grid4[i-28] = r;
   queuex[i%resetgetal] = newNumber; 
   
 }else  if(i==37 || i==38 || i==39){
   grid4[i-37+3] = r;
   queuex[i%resetgetal] = newNumber;
   }
   else  if(i==46 || i==47 || i==48){
   grid4[i-40] = r;
   queuex[i%resetgetal] = newNumber; 
   }else 
 
 if(i==31 || i==32 || i==33){
   grid5[i-31] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==40 || i==41 || i==42){
   grid5[i-6-31] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==49 || i==50 || i==51){
   grid5[i-12-31] = r;
   queuex[i%resetgetal] = newNumber; 
 }else 
 
 if(i==34 || i==35 || i==36){
   grid6[i-34] = r;
   queuex[i%resetgetal] = newNumber;
   }
   else  if(i==43 || i==44 || i==45){
   grid6[i-6-34] = r;
   queuex[i%resetgetal] = newNumber;
   }
   else  if(i==52 || i==53 || i==54){
   
   grid6[i-12-34] = r;
   queuex[i%resetgetal] = newNumber; 
   }else 
 
 if(i==55 || i==56 || i==57){
   grid7[i-55] = r;
   queuex[i%resetgetal] = newNumber;
   }
   else  if(i==64 || i==65 || i==66){
   grid7[i-6-55] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==73 || i==74 || i==75){
  grid7[i-12-55] = r;
   queuex[i%resetgetal] = newNumber; 
   }else 
 
 if(i==58 || i==59 || i==60){
   grid8[i-58] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==67 || i==68 || i==69){
   grid8[i-6-58] = r;
   queuex[i%resetgetal] = newNumber;
   }
   else  if(i==76 || i==77 || i==78){
   grid8[i-12-58] = r;
   queuex[i%resetgetal] = newNumber; 
   }else 
 
 if(i==61 || i==62 || i==63){
   grid9[i-61] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==70 || i==71 || i==72){
   grid9[i-6-61] = r;
   queuex[i%resetgetal] = newNumber; 
   }
   else  if(i==79 || i==80 || i==81){
   grid9[i-12-61] = r;
   queuex[i%resetgetal] = newNumber; 
   }
 
}
IntList deleteSudlist = new IntList();

public void deleteSud(int moeilijkheid) {
  for (int i = 1; i<82; i++) {
    deleteSudlist.append(i);
  }
  deleteSudlist.shuffle();
  int deleteSudRan[] = deleteSudlist.array();

  for (int i = 0; i<moeilijkheid; i++) {

    int r = 0;
    int x = deleteSudRan[i];
     println(deleteSudRan[i]);
    identifyXYZ(x);
    checkzw(x, r, false);
    checkyw(x, r, false);  
    checkxw(x, r, false);


    
  }
  for (int o = 1; o<82; o++) {
      deleteSudlist.append(o);
    }
    deleteSudlist.clear();  
}
int x;
int y; 
int z;

public void identifyXYZ(int i) {
  if (i<10) {
    if (i==1) {
      x = s1[1];  
      y = s1[2];  
      z = s1[3];
    } else if (i==2) { 
      x = s2[1];  
      y = s2[2];  
      z = s2[3];
    } else if (i==3) { 
      x = s3[1];  
      y = s3[2];  
      z = s3[3];
    } else if (i==4) { 
      x = s4[1];  
      y = s4[2];  
      z = s4[3];
    } else if (i==5) { 
      x = s5[1];  
      y = s5[2];  
      z = s5[3];
    } else if (i==6) { 
      x = s6[1];  
      y = s6[2];  
      z = s6[3];
    } else if (i==7) { 
      x = s7[1];  
      y = s7[2];  
      z = s7[3];
    } else if (i==8) { 
      x = s8[1];  
      y = s8[2];  
      z = s8[3];
    } else if (i==9) { 
      x = s9[1];  
      y = s9[2];  
      z = s9[3];
    }
  } else if (i<19 && i>9) {
    if (i==10) { 
      x = s10[1];  
      y = s10[2];  
      z = s10[3];
    } else if (i==11) {
      x = s11[1];  
      y = s11[2];  
      z = s11[3];
    } else if (i==12) {
      x = s12[1];  
      y = s12[2];  
      z = s12[3];
    } else if (i==13) { 
      x = s13[1];  
      y = s13[2];  
      z = s13[3];
    } else if (i==14) { 
      x = s14[1];  
      y = s14[2];  
      z = s14[3];
    } else if (i==15) { 
      x = s15[1];  
      y = s15[2];  
      z = s15[3];
    } else if (i==16) {
      x = s16[1];  
      y = s16[2];  
      z = s16[3];
    } else if (i==17) { 
      x = s17[1];  
      y = s17[2];  
      z = s17[3];
    } else if (i==18) { 
      x = s18[1];  
      y = s18[2];  
      z = s18[3];
    }
  } else if (i<28 && i>18) {
    if (i==19) { 
      x = s19[1];  
      y = s19[2];  
      z = s19[3];
    } else if (i==20) {
      x = s20[1];  
      y = s20[2];  
      z = s20[3];
    } else if (i==21) {
      x = s21[1];  
      y = s21[2];  
      z = s21[3];
    } else if (i==22) {
      x = s22[1];  
      y = s22[2];  
      z = s22[3];
    } else if (i==23) { 
      x = s23[1];  
      y = s23[2];  
      z = s23[3];
    } else if (i==24) { 
      x = s24[1];  
      y = s24[2];  
      z = s24[3];
    } else if (i==25) { 
      x = s25[1];  
      y = s25[2];  
      z = s25[3];
    } else if (i==26) { 
      x = s26[1];  
      y = s26[2];  
      z = s26[3];
    } else if (i==27) { 
      x = s27[1];  
      y = s27[2];  
      z = s27[3];
    }
  } else if (i<38 & i>27) { 
    if (i==28) { 
      x = s28[1];  
      y = s28[2];  
      z = s28[3];
    } else if (i==29) { 
      x = s29[1];  
      y = s29[2];  
      z = s29[3];
    } else if (i==30) { 
      x = s30[1];  
      y = s30[2];  
      z = s30[3];
    } else if (i==31) { 
      x = s31[1];  
      y = s31[2];  
      z = s31[3];
    } else if (i==32) { 
      x = s32[1];  
      y = s32[2];  
      z = s32[3];
    } else if (i==33) { 
      x = s33[1];  
      y = s33[2];  
      z = s33[3];
    } else if (i==34) { 
      x = s34[1];  
      y = s34[2];  
      z = s34[3];
    } else if (i==35) { 
      x = s35[1];  
      y = s35[2];  
      z = s35[3];
    } else if (i==36) { 
      x = s36[1];  
      y = s36[2];  
      z = s36[3];
    } else if (i==37) {
      x = s37[1];  
      y = s37[2];  
      z = s37[3];
    }
  } else if (i<46 & i>37) { 
    if (i==38) { 
      x = s38[1];  
      y = s38[2];  
      z = s38[3];
    } else if (i==39) { 
      x = s39[1];  
      y = s39[2];  
      z = s39[3];
    } else if (i==40) { 
      x = s40[1];  
      y = s40[2];  
      z = s40[3];
    } else if (i==41) { 
      x = s41[1];  
      y = s41[2];  
      z = s41[3];
    } else if (i==42) { 
      x = s42[1];  
      y = s42[2];  
      z = s42[3];
    } else if (i==43) { 
      x = s43[1];  
      y = s43[2];  
      z = s43[3];
    } else if (i==44) { 
      x = s44[1];  
      y = s44[2];  
      z = s44[3];
    } else if (i==45) { 
      x = s45[1];  
      y = s45[2];  
      z = s45[3];
    }
  } else if (i<55 & i>45) { 
    if (i==46) { 
      x = s46[1];  
      y = s46[2];  
      z = s46[3];
    } else if (i==47) { 
      x = s47[1];  
      y = s47[2];  
      z = s47[3];
    } else if (i==48) { 
      x = s48[1];  
      y = s48[2];  
      z = s48[3];
    } else if (i==49) { 
      x = s49[1];  
      y = s49[2];  
      z = s49[3];
    } else if (i==50) { 
      x = s50[1];  
      y = s50[2];  
      z = s50[3];
    } else if (i==51) { 
      x = s51[1];  
      y = s51[2];  
      z = s51[3];
    } else if (i==52) {
      x = s52[1];  
      y = s52[2];  
      z = s52[3];
    } else if (i==53) {
      x = s53[1];  
      y = s53[2];  
      z = s53[3];
    } else if (i==54) { 
      x = s54[1];  
      y = s54[2];  
      z = s54[3];
    }
  } else if (i<64 & i>54) { 
    if (i==55) { 
      x = s55[1];  
      y = s55[2];  
      z = s55[3];
    } else if (i==56) { 
      x = s56[1];  
      y = s56[2];  
      z = s56[3];
    } else if (i==57) { 
      x = s57[1];  
      y = s57[2];  
      z = s57[3];
    } else if (i==58) { 
      x = s58[1];  
      y = s58[2];  
      z = s58[3];
    } else if (i==59) { 
      x = s59[1];  
      y = s59[2];  
      z = s59[3];
    } else if (i==60) { 
      x = s60[1];  
      y = s60[2];  
      z = s60[3];
    } else if (i==61) { 
      x = s61[1];  
      y = s61[2];  
      z = s61[3];
    } else if (i==62) { 
      x = s62[1];  
      y = s62[2];  
      z = s62[3];
    } else if (i==63) { 
      x = s63[1];  
      y = s63[2];  
      z = s63[3];
    }
  } else if (i<73 & i>63) { 
    if (i==64) {
      x = s64[1];  
      y = s64[2];  
      z = s64[3];
    } else if (i==65) { 
      x = s65[1];  
      y = s65[2];  
      z = s65[3];
    } else if (i==66) { 
      x = s66[1];  
      y = s66[2];  
      z = s66[3];
    } else if (i==67) { 
      x = s67[1];  
      y = s67[2];  
      z = s67[3];
    } else if (i==68) { 
      x = s68[1];  
      y = s68[2];  
      z = s68[3];
    } else if (i==69) { 
      x = s69[1];  
      y = s69[2];  
      z = s69[3];
    } else if (i==70) {
      x = s70[1];  
      y = s70[2];  
      z = s70[3];
    } else if (i==71) { 
      x = s71[1];  
      y = s71[2];  
      z = s71[3];
    } else if (i==72) { 
      x = s72[1];  
      y = s72[2];  
      z = s72[3];
    }
  } else if (i<82 & i>72) { 
    if (i==73) { 
      x = s73[1];  
      y = s73[2];  
      z = s73[3];
    } else if (i==74) { 
      x = s74[1];  
      y = s74[2];  
      z = s74[3];
    } else if (i==75) { 
      x = s75[1];  
      y = s75[2];  
      z = s75[3];
    } else if (i==76) { 
      x = s76[1];  
      y = s76[2];  
      z = s76[3];
    } else if (i==77) { 
      x = s77[1];  
      y = s77[2];  
      z = s77[3];
    } else if (i==78) { 
      x = s78[1];  
      y = s78[2];  
      z = s78[3];
    } else if (i==79) { 
      x = s79[1];  
      y = s79[2];  
      z = s79[3];
    } else if (i==80) { 
      x = s80[1];  
      y = s80[2];  
      z = s80[3];
    } else if (i==81) { 
      x = s81[1];  
      y = s81[2];  
      z = s81[3];
    }
  }
}
boolean begin = false;
class MyButton extends Controller {

  int current = 0xffff0000;

  float a = 128;
  
  float na =180;
  
  int y;
  
  // use the convenience constructor of super class Controller
  // MyButton will automatically registered and move to the 
  // default controlP5 tab.
  
  MyButton(ControlP5 cp5, String theName) {
    super(cp5, theName);
    
    // replace the default view with a custom view.
    setView(new ControllerView() {
      public void display(PGraphics p, Object b) {
        // draw button background
 
        p.fill(current,na);
        p.rect(0, 0, getWidth(), getHeight());
        

       translate(0,getHeight()+14);
        p.text(getName(),0,0);

        
      }
    }
    );
  }

  // override various input methods for mouse input control
  public void onEnter() {
    cursor(HAND);

  }
 
  public void onClick() {
    begin = true;
    g=0;
  }
 
  public void onReleaseOutside() {
    onLeave();
  }

  public void onLeave() {
    cursor(ARROW);
  }
}
public void printSud(){
  println();
 print(horizontaal1[0]);print(horizontaal1[1]);print(horizontaal1[2]);print("..");print(horizontaal1[3]);print(horizontaal1[4]);print(horizontaal1[5]);print("..");print(horizontaal1[6]);print(horizontaal1[7]);println(horizontaal1[8]);
 println("..............");
 print(horizontaal2[0]);print(horizontaal2[1]);print(horizontaal2[2]);print("..");print(horizontaal2[3]);print(horizontaal2[4]);print(horizontaal2[5]);print("..");print(horizontaal2[6]);print(horizontaal2[7]);println(horizontaal2[8]);
 println("..............");
 print(horizontaal3[0]);print(horizontaal3[1]);print(horizontaal3[2]);print("..");print(horizontaal3[3]);print(horizontaal3[4]);print(horizontaal3[5]);print("..");print(horizontaal3[6]);print(horizontaal3[7]);println(horizontaal3[8]);
 println("..............");
 print(horizontaal4[0]);print(horizontaal4[1]);print(horizontaal4[2]);print("..");print(horizontaal4[3]);print(horizontaal4[4]);print(horizontaal4[5]);print("..");print(horizontaal4[6]);print(horizontaal4[7]);println(horizontaal4[8]);
 println("..............");
 print(horizontaal5[0]);print(horizontaal5[1]);print(horizontaal5[2]);print("..");print(horizontaal5[3]);print(horizontaal5[4]);print(horizontaal5[5]);print("..");print(horizontaal5[6]);print(horizontaal5[7]);println(horizontaal5[8]);
 println("..............");
 print(horizontaal6[0]);print(horizontaal6[1]);print(horizontaal6[2]);print("..");print(horizontaal6[3]);print(horizontaal6[4]);print(horizontaal6[5]);print("..");print(horizontaal6[6]);print(horizontaal6[7]);println(horizontaal6[8]);
 println("..............");
 print(horizontaal7[0]);print(horizontaal7[1]);print(horizontaal7[2]);print("..");print(horizontaal7[3]);print(horizontaal7[4]);print(horizontaal7[5]);print("..");print(horizontaal7[6]);print(horizontaal7[7]);println(horizontaal7[8]);
 println("..............");
 print(horizontaal8[0]);print(horizontaal8[1]);print(horizontaal8[2]);print("..");print(horizontaal8[3]);print(horizontaal8[4]);print(horizontaal8[5]);print("..");print(horizontaal8[6]);print(horizontaal8[7]);println(horizontaal8[8]);
 println("..............");
 print(horizontaal9[0]);print(horizontaal9[1]);print(horizontaal9[2]);print("..");print(horizontaal9[3]);print(horizontaal9[4]);print(horizontaal9[5]);print("..");print(horizontaal9[6]);print(horizontaal9[7]);println(horizontaal9[8]);
 println("..............");
  
  
}
int tempi;  
public int resetWaardes(int i,int r){
  if(resetgetal==27){ tempi = (i-1)%resetgetal;}else{
  tempi = (i-1)%(resetgetal+1);}
  for(int j = 0; j<tempi; j++){    
    
    identifyXYZ(i-1-j);
    checkzw(i-1-j,r,false);  
    checkyw(i-1-j,r,false);   
    checkxw(i-1-j,r,false);       
    if(j==tempi-1){  
    totaalfout=0;
    i=i-j;  
    int returning = i -(i%resetgetal);  
    return returning;
    }
  }
  int returning = i -((i-1)%resetgetal);
  return returning;
}
public void setupSud(){
  //
for (int i = 1; i<82; i++) {
    int r = PApplet.parseInt(random(1, 10));   
    
    identifyXYZ(i);

    terugcheck = checkWaardes(x, y, z, r, i);
    i=terugcheck[0];
    overallfout=terugcheck[1];

    if(i%resetgetal==0){
     for(int x = 0; x<resetgetal; x++){
        queuex[x] = 0;
        queuey[x] = 0;
        queuez[x] = 0; 
     }
    }
    if(i==81){
 int time = millis();
 println(time);                               
    }
  }
}
//alle waardes die in de sudoku komen te staan op de horizontale as
public int[]horizontaal1 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal2 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal3 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal4 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal5 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal6 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal7 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal8 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal9 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};

//alle waardes die in de sudoku komen te staan op de verticale as
public int[]verticaal1 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal2 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal3 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal4 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal5 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal6 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal7 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal8 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal9 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};

//alle waardes die in de sudoku komen te in de 3x3 vakjes
public int[]grid1 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid2 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid3 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid4 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid5 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid6 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid7 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid8 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid9 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};

//alle waardes gekeken vanaf links boven naar rechts onder dus: 
//1,2,3,4,5,6,7,8,9
//10,11,12,13,14,15,16,17,18
//etc
//de arrays geven de volgende dingen aan: naam = { de waarde van deze locatie in de sudoku, de verticale as waarin hij zit, de horizonatle  as waarin hij zit, het 3x3 blok waarin hij zit.
public int[]s1 = {horizontaal1[0], 1, 1, 1};
public int[]s2 = {horizontaal1[1], 2, 1, 1};
public int[]s3 = {horizontaal1[2], 3, 1, 1};
public int[]s4 = {horizontaal1[3], 4, 1, 2};
public int[]s5 = {horizontaal1[4], 5, 1, 2};
public int[]s6 = {horizontaal1[5], 6, 1, 2};
public int[]s7 = {horizontaal1[6], 7, 1, 3};
public int[]s8 = {horizontaal1[7], 8, 1, 3};
public int[]s9 = {horizontaal1[8], 9, 1, 3};
public int[]s10 = {horizontaal2[0], 1, 2, 1};
public int[]s11 = {horizontaal2[1], 2, 2, 1};
public int[]s12 = {horizontaal2[2], 3, 2, 1};
public int[]s13 = {horizontaal2[3], 4, 2, 2};
public int[]s14 = {horizontaal2[4], 5, 2, 2};
public int[]s15 = {horizontaal2[5], 6, 2, 2};
public int[]s16 = {horizontaal2[6], 7, 2, 3};
public int[]s17 = {horizontaal2[7], 8, 2, 3};
public int[]s18 = {horizontaal2[8], 9, 2, 3};
public int[]s19 = {horizontaal3[0], 1, 3, 1};
public int[]s20 = {horizontaal3[1], 2, 3, 1};
public int[]s21 = {horizontaal3[2], 3, 3, 1};
public int[]s22 = {horizontaal3[3], 4, 3, 2};
public int[]s23 = {horizontaal3[4], 5, 3, 2};
public int[]s24 = {horizontaal3[5], 6, 3, 2};
public int[]s25 = {horizontaal3[6], 7, 3, 3};
public int[]s26 = {horizontaal3[7], 8, 3, 3};
public int[]s27 = {horizontaal3[8], 9, 3, 3};
public int[]s28 = {horizontaal4[0], 1, 4, 4};
public int[]s29 = {horizontaal4[1], 2, 4, 4};
public int[]s30 = {horizontaal4[2], 3, 4, 4};
public int[]s31 = {horizontaal4[3], 4, 4, 5};
public int[]s32 = {horizontaal4[4], 5, 4, 5};
public int[]s33 = {horizontaal4[5], 6, 4, 5};
public int[]s34 = {horizontaal4[6], 7, 4, 6};
public int[]s35 = {horizontaal4[7], 8, 4, 6};
public int[]s36 = {horizontaal4[8], 9, 4, 6};
public int[]s37 = {horizontaal5[0], 1, 5, 4};
public int[]s38 = {horizontaal5[1], 2, 5, 4};
public int[]s39 = {horizontaal5[2], 3, 5, 4};
public int[]s40 = {horizontaal5[3], 4, 5, 5};
public int[]s41 = {horizontaal5[4], 5, 5, 5};
public int[]s42 = {horizontaal5[5], 6, 5, 5};
public int[]s43 = {horizontaal5[6], 7, 5, 6};
public int[]s44 = {horizontaal5[7], 8, 5, 6};
public int[]s45 = {horizontaal5[8], 9, 5, 6};
public int[]s46 = {horizontaal6[0], 1, 6, 4};
public int[]s47 = {horizontaal6[1], 2, 6, 4};
public int[]s48 = {horizontaal6[2], 3, 6, 4};
public int[]s49 = {horizontaal6[3], 4, 6, 5};
public int[]s50 = {horizontaal6[4], 5, 6, 5};
public int[]s51 = {horizontaal6[5], 6, 6, 5};
public int[]s52 = {horizontaal6[6], 7, 6, 6};
public int[]s53 = {horizontaal6[7], 8, 6, 6};
public int[]s54 = {horizontaal6[8], 9, 6, 6};
public int[]s55 = {horizontaal7[0], 1, 7, 7};
public int[]s56 = {horizontaal7[1], 2, 7, 7};
public int[]s57 = {horizontaal7[2], 3, 7, 7};
public int[]s58 = {horizontaal7[3], 4, 7, 8};
public int[]s59 = {horizontaal7[4], 5, 7, 8};
public int[]s60 = {horizontaal7[5], 6, 7, 8};
public int[]s61 = {horizontaal7[6], 7, 7, 9};
public int[]s62 = {horizontaal7[7], 8, 7, 9};
public int[]s63 = {horizontaal7[8], 9, 7, 9};
public int[]s64 = {horizontaal8[0], 1, 8, 7};
public int[]s65 = {horizontaal8[1], 2, 8, 7};
public int[]s66 = {horizontaal8[2], 3, 8, 7};
public int[]s67 = {horizontaal8[3], 4, 8, 8};
public int[]s68 = {horizontaal8[4], 5, 8, 8};
public int[]s69 = {horizontaal8[5], 6, 8, 8};
public int[]s70 = {horizontaal8[6], 7, 8, 9};
public int[]s71 = {horizontaal8[7], 8, 8, 9};
public int[]s72 = {horizontaal8[8], 9, 8, 9};
public int[]s73 = {horizontaal9[0], 1, 9, 7};
public int[]s74 = {horizontaal9[1], 2, 9, 7};
public int[]s75 = {horizontaal9[2], 3, 9, 7};
public int[]s76 = {horizontaal9[3], 4, 9, 8};
public int[]s77 = {horizontaal9[4], 5, 9, 8};
public int[]s78 = {horizontaal9[5], 6, 9, 8};
public int[]s79 = {horizontaal9[6], 7, 9, 9};
public int[]s80 = {horizontaal9[7], 8, 9, 9};
public int[]s81 = {horizontaal9[8], 9, 9, 9};

public int[]sallint = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
public boolean[]sallbool = {true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false};
public int[] checkX(int r, boolean Unique) {  //<>// //<>//
  for (int j = 0; j<9; j++) { 
    if (!Unique) {
      if (x==1) {
        if (verticaal1[j]==r) {
          bevatwelx = 1;
        } else if (verticaal1[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==2) {
        if (verticaal2[j]==r) {
          bevatwelx = 1;
        } else if (verticaal2[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==3) {
        if (verticaal3[j]==r) {
          bevatwelx = 1;
        } else if (verticaal3[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==4) {
        if (verticaal4[j]==r) {
          bevatwelx = 1;
        } else if (verticaal4[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==5) {
        if (verticaal5[j]==r) {
          bevatwelx = 1;
        } else if (verticaal5[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==6) {
        if (verticaal6[j]==r) {
          bevatwelx = 1;
        } else if (verticaal6[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==7) {
        if (verticaal7[j]==r) {
          bevatwelx = 1;
        } else if (verticaal7[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==8) {
        if (verticaal8[j]==r) {
          bevatwelx = 1;
        } else if (verticaal8[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==9) {
        if (verticaal9[j]==r) {
          bevatwelx = 1;
        } else if (verticaal9[j]!=r) {
          bevatnietx += 1;
        }
      }
    }
    //if (Unique) {
    //  if (x==1) {
    //    if (verticaal1[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal1[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==2) {
    //    if (verticaal2[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal2[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==3) {
    //    if (verticaal3[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal3[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==4) {
    //    if (verticaal4[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal4[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==5) {
    //    if (verticaal5[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal5[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==6) {
    //    if (verticaal6[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal6[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==7) {
    //    if (verticaal7[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal7[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==8) {
    //    if (verticaal8[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal8[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==9) {
    //    if (verticaal9[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal9[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  }
    //  int[] tempx = new int[2];
    //  tempx[0]=bevatwelunx;
    //  tempx[1]=bevatnietunx;
    //  return tempx;
    //}
  }

  int[] tempx = new int[2];
  tempx[0]=bevatwelx;
  tempx[1]=bevatnietx;
  return tempx;
}
public int[] checkY(int k, int r, boolean Unique) {
  if(!Unique){
  for (int j = 0; j<9; j++) {
    if (y==1) {
      if (horizontaal1[j]==r) {
        bevatwely = 1;
      } else if (horizontaal1[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==2) {
      if (horizontaal2[j]==r) {
        bevatwely = 1;
      } else if (horizontaal2[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==3) {
      if (horizontaal3[j]==r) {
        bevatwely = 1;
      } else if (horizontaal3[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==4) {
      if (horizontaal4[j]==r) {
        bevatwely = 1;
      } else if (horizontaal4[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==5) {
      if (horizontaal5[j]==r) {
        bevatwely = 1;
      } else if (horizontaal5[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==6) {
      if (horizontaal6[j]==r) {
        bevatwely = 1;
      } else if (horizontaal6[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==7) {
      if (horizontaal7[j]==r) {
        bevatwely = 1;
      } else if (horizontaal7[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==8) {
      if (horizontaal8[j]==r) {
        bevatwely = 1;
      } else if (horizontaal8[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==9) {
      if (horizontaal9[j]==r) {
        bevatwely = 1;
      } else if (horizontaal9[j]!=r) {
        bevatniety += 1;
      }
    }
  }}
   else if(Unique){
    if (y==1) {
      if (horizontaal1[k]==r) {
        bevatweluny = 1;
      } else if (horizontaal1[k]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==2) {
      if (horizontaal2[k-9]==r) {
        bevatweluny = 1;
      } else if (horizontaal2[k-9]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==3) {
      if (horizontaal3[k-18]==r) {
        bevatweluny = 1;
      } else if (horizontaal3[k-18]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==4) {
      if (horizontaal4[k-27]==r) {
        bevatweluny = 1;
      } else if (horizontaal4[k-27]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==5) {
      if (horizontaal5[k-36]==r) {
        bevatweluny = 1;
      } else if (horizontaal5[k-36]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==6) {
      if (horizontaal6[k-45]==r) {
        bevatweluny = 1;
      } else if (horizontaal6[k-45]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==7) {
      if (horizontaal7[k-54]==r) {
        bevatweluny = 1;
      } else if (horizontaal7[k-54]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==8) {
      if (horizontaal8[k-63]==r) {
        bevatweluny = 1;
      } else if (horizontaal8[k-63]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==9) {
      if (horizontaal9[k-72]==r) {
        bevatweluny = 1;
      } else if (horizontaal9[k-72]!=r) {
        bevatnietuny += 1;
      
    }
  }
  int[] tempy = new int[2];
  tempy[0]=bevatweluny;
  tempy[1]=bevatnietuny;
  return tempy;
}
  
  int[] tempy = new int[2];
  tempy[0]=bevatwely;
  tempy[1]=bevatniety;
  return tempy;
}
public int[] checkZ(int r) {
  for (int j = 0; j<9; j++) {
    if (z==1) {
      if (grid1[j]==r) {
        bevatwelz = 1;
      } else if (grid1[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==2) {
      if (grid2[j]==r) {
        bevatwelz = 1;
      } else if (grid2[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==3) {
      if (grid3[j]==r) {
        bevatwelz = 1;
      } else if (grid3[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==4) {
      if (grid4[j]==r) {
        bevatwelz = 1;
      } else if (grid4[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==5) {
      if (grid5[j]==r) {
        bevatwelz = 1;
      } else if (grid5[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==6) {
      if (grid6[j]==r) {
        bevatwelz = 1;
      } else if (grid6[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==7) {
      if (grid7[j]==r) {
        bevatwelz = 1;
      } else if (grid7[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==8) {
      if (grid8[j]==r) {
        bevatwelz = 1;
      } else if (grid8[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==9) {
      if (grid9[j]==r) {
        bevatwelz = 1;
      } else if (grid9[j]!=r) {
        bevatnietz += 1;
      }
    }
  }
  int[] tempz = new int[2];
  tempz[0]=bevatwelz;
  tempz[1]=bevatnietz;
  return tempz;
}
  public void settings() {  size(497, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "testing14" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
