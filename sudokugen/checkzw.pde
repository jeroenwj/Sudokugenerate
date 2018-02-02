//Deze code voegt de ingevoerde waarde toe aan de array waar deze inhoort. //<>//
//Ook kan deze array waardes verwijderen uit een array.
void checkzw(int i, int r, boolean add){   //(het s#getal [zie setupWaardes], Het getal waarvoor de eerdere waarde
  int newNumber= i;                        // veranderd moet worden, of de waarde verijderd woord of juist toegevoegd)
  
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