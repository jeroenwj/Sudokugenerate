//in dit stuk algoritme word gekeken of de plek in de sudoku de waarde bevat die mee gegeven is aan deze functie.
int[] checkY(int k, int r, boolean Unique) {
  if(!Unique){
  for (int j = 0; j<9; j++) {
    if (y==1) {
      if (horizontaal1[j]==r) {
        bevatwely = 1;
      } else if (horizontaal1[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==2) {
      if (horizontaal2[j]==r) {
        bevatwely = 1;
      } else if (horizontaal2[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==3) {
      if (horizontaal3[j]==r) {
        bevatwely = 1;
      } else if (horizontaal3[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==4) {
      if (horizontaal4[j]==r) {
        bevatwely = 1;
      } else if (horizontaal4[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==5) {
      if (horizontaal5[j]==r) {
        bevatwely = 1;
      } else if (horizontaal5[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==6) {
      if (horizontaal6[j]==r) {
        bevatwely = 1;
      } else if (horizontaal6[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==7) {
      if (horizontaal7[j]==r) {
        bevatwely = 1;
      } else if (horizontaal7[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==8) {
      if (horizontaal8[j]==r) {
        bevatwely = 1;
      } else if (horizontaal8[j]!=r) {
        bevatniety += 1;
      }
    } else if (y==9) {
      if (horizontaal9[j]==r) {
        bevatwely = 1;
      } else if (horizontaal9[j]!=r) {
        bevatniety += 1;
      }
    }
  }}
   else if(Unique){
    if (y==1) {
      if (horizontaal1[k]==r) {
        bevatweluny = 1;
      } else if (horizontaal1[k]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==2) {
      if (horizontaal2[k-9]==r) {
        bevatweluny = 1;
      } else if (horizontaal2[k-9]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==3) {
      if (horizontaal3[k-18]==r) {
        bevatweluny = 1;
      } else if (horizontaal3[k-18]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==4) {
      if (horizontaal4[k-27]==r) {
        bevatweluny = 1;
      } else if (horizontaal4[k-27]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==5) {
      if (horizontaal5[k-36]==r) {
        bevatweluny = 1;
      } else if (horizontaal5[k-36]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==6) {
      if (horizontaal6[k-45]==r) {
        bevatweluny = 1;
      } else if (horizontaal6[k-45]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==7) {
      if (horizontaal7[k-54]==r) {
        bevatweluny = 1;
      } else if (horizontaal7[k-54]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==8) {
      if (horizontaal8[k-63]==r) {
        bevatweluny = 1;
      } else if (horizontaal8[k-63]!=r) {
        bevatnietuny += 1;
      }
    } else if (y==9) {
      if (horizontaal9[k-72]==r) {
        bevatweluny = 1;
      } else if (horizontaal9[k-72]!=r) {
        bevatnietuny += 1;
      
    }
  }
  int[] tempy = new int[2];
  tempy[0]=bevatweluny;
  tempy[1]=bevatnietuny;
  return tempy;
}
  
  int[] tempy = new int[2];
  tempy[0]=bevatwely;
  tempy[1]=bevatniety;
  return tempy;
}