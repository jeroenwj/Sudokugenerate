int tempi;  
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