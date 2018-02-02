IntList deleteSudlist = new IntList();


void deleteSud(int moeilijkheid) { //<>//
  //Deze code genereerd eerst een array met de getallen 1 tm 81
  //Daarna word deze array door elkaar geschud
  //En door de moeilijkheid word daarna bepaald hoeveel
  //van deze getallen verwijderd gaan worden.
  //Dit zijn dus willekuriger plekken van de sudoku.
  for (int i = 1; i<82; i++) {
    deleteSudlist.append(i);
  }
  deleteSudlist.shuffle();
  int deleteSudRan[] = deleteSudlist.array();

  for (int i = 0; i<moeilijkheid; i++) {

    int r = 0;
    int x = deleteSudRan[i];
    identifyXYZ(x);
    checkzw(x, r, false);
    checkyw(x, r, false);  
    checkxw(x, r, false);
  
  }
  for (int o = 1; o<82; o++) {
      deleteSudlist.append(o);
    }
    deleteSudlist.clear();  
}