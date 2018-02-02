
int xz; //<>//

//Deze code voegt de ingevoerde waarde toe aan de array waar deze inhoort.
//Ook kan deze array waardes verwijderen uit een array.

void checkxw(int i, int r, boolean add){  //(het s#getal [zie setupWaardes], Het getal waarvoor de eerdere waarde
 int h;                                   // veranderd moet worden, of de waarde verijderd woord of juist toegevoegd)
 
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