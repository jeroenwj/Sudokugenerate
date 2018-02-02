IntList deleteSudlist = new IntList();

void deleteSud(int moeilijkheid) {
  for (int i = 1; i<82; i++) {
    deleteSudlist.append(i);
  }
  deleteSudlist.shuffle();
  int deleteSudRan[] = deleteSudlist.array();

  for (int i = 0; i<moeilijkheid; i++) {

    int r = 0;
    int x = deleteSudRan[i];
     println(deleteSudRan[i]);
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