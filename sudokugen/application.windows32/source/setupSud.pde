void setupSud(){
  //
for (int i = 1; i<82; i++) {
    int r = int(random(1, 10));   
    
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