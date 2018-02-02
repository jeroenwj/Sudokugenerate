//in dit stuk algoritme word gekeken of de plek in de sudoku de waarde bevat die mee gegeven is aan deze functie.
int[] checkZ(int r) {
  for (int j = 0; j<9; j++) {
    if (z==1) {
      if (grid1[j]==r) {
        bevatwelz = 1;
      } else if (grid1[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==2) {
      if (grid2[j]==r) {
        bevatwelz = 1;
      } else if (grid2[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==3) {
      if (grid3[j]==r) {
        bevatwelz = 1;
      } else if (grid3[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==4) {
      if (grid4[j]==r) {
        bevatwelz = 1;
      } else if (grid4[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==5) {
      if (grid5[j]==r) {
        bevatwelz = 1;
      } else if (grid5[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==6) {
      if (grid6[j]==r) {
        bevatwelz = 1;
      } else if (grid6[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==7) {
      if (grid7[j]==r) {
        bevatwelz = 1;
      } else if (grid7[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==8) {
      if (grid8[j]==r) {
        bevatwelz = 1;
      } else if (grid8[j]!=r) {
        bevatnietz += 1;
      }
    } else if (z==9) {
      if (grid9[j]==r) {
        bevatwelz = 1;
      } else if (grid9[j]!=r) {
        bevatnietz += 1;
      }
    }
  }
  int[] tempz = new int[2];
  tempz[0]=bevatwelz;
  tempz[1]=bevatnietz;
  return tempz;
}