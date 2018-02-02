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