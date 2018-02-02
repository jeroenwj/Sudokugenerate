int tempi;  

//Deze functie zorgt ervoor dat de waarders die verwijderd moeten worden 
//Ook echt verwijderd worden uit alle arrays.
//Deze functie kan aangeroepen worden tijdens het genereren van het
//9x9 getallen blok.
int resetWaardes(int i,int r){
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