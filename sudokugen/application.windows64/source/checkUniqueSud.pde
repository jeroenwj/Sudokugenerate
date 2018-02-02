int bevatweluny = 0;  //<>//
int bevatnietuny = 0;
int totaleoplossingen = 0;

int checkUniqueSud() {
  checkUniqueSud1();
  int g = checkUniqueSud3();
  return g;
}

//Hier word nagegaan of het getal in de sudoku al bestaat of verwijderd is.
void checkUniqueSud1() {
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
int checkUniqueSud3() {
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