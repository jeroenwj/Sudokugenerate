void setupSud(){
  //deze code start het proces van het opstarten van het 9x9 getallen veld.
  //er word stap voor stap voor elke positie in de sudoku een random getal gegenereerd.
for (int i = 1; i<82; i++) {
    int r = int(random(1, 10));   
    identifyXYZ(i);
    
    //Daarna word er gekeken of de gekozen random waarde ook echt aan deze plek toegekent kan worden.
    terugcheck = checkWaardes(x, y, z, r, i);
    i=terugcheck[0];
    overallfout=terugcheck[1];
    
    //elke 27 vakjes word het resetgetal verwijderd 
    //(Hierin staan de waardes die weg moeten wanneer de sudoku generatie vast loopt.)
    if(i%resetgetal==0){
     for(int x = 0; x<resetgetal; x++){
        queuex[x] = 0;
        queuey[x] = 0;
        queuez[x] = 0; 
     }
    }
  }
  
  
  //Hier word de array gegenereerd waarin het antwoord van de sudoku in opgeslagen staat.
  for (int k=1; k<82; k++) {
    for (int r= 1; r<10; r++)
    {
      identifyXYZ(k);
      int[] ytemp = new int[2];
      ytemp = checkY(k-1%9, r, true ); 
      bevatweluny = ytemp[0];
      bevatnietuny = ytemp[1];
      if (bevatweluny == 1) {
        antwoordt[k-1]=r;
        bevatweluny=0;
        bevatnietuny=0;
        r = 10;
      }
      
    }
  }
}