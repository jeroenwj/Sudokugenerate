int bevatwelx=0; 
int bevatnietx=0;
int bevatwely=0;
int bevatniety=0;
int bevatwelz=0;
int bevatnietz=0;
int totaalfout=0;
int totaalgedaan=0;
int[] bevastal = new int[8];

int[] checkWaardes(int x, int y, int z, int r, int i) {  
  //Deze functie zorgt ervoor dat het 9x9 veld inword gevuld volgens de sudoku regels.
  totaalgedaan+=1;  
  if (totaalfout>=30) {
    i =resetWaardes(i, r);
  } else {  
    //Als eerst word er gekeken of de waarde al in een van de rijern/blokken zit
    checkX(r, false);  
    checkY(0, r, false);
    checkZ(r); 

    //Als dit het geval is dan word deze code afgebroken en gaat hij terug naar de stap hiervoor.
    if (bevatwelz >=1 ||bevatwely >=1 || bevatwelx >=1) {
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
    //stel dat de waarde nog niet in een van de rijen zit dan word deze hieraan toegekent.
    else if ( bevatnietx == 9 &&  bevatniety == 9 &&  bevatnietz == 9) {
      bevatnietx=0;
      bevatniety=0;
      bevatnietz=0;
      bevatwelx=0;
      bevatwely=0;
      bevatwelz=0;
      totaalfout=0;

      checkzw(i, r, true);
      checkyw(i, r, true); 
      checkxw(i, r, true);
    }
  }
  int[] tempvar = new int[2];
  tempvar[1]=overallfout;
  tempvar[0]=i;
  return tempvar;
}