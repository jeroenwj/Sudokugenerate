//Deze code voegt de ingevoerde waarde toe aan de array waar deze inhoort.
//Ook kan deze array waardes verwijderen uit een array.
 void checkyw(int i, int r,boolean add){  //(het s#getal [zie setupWaardes], Het getal waarvoor de eerdere waarde //<>//
   int newNumber=i;                       // veranderd moet worden, of de waarde verijderd woord of juist toegevoegd)
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