//alle waardes die in de sudoku komen te staan op de horizontale as
public int[]horizontaal1 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal2 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal3 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal4 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal5 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal6 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal7 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal8 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]horizontaal9 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};

//alle waardes die in de sudoku komen te staan op de verticale as
public int[]verticaal1 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal2 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal3 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal4 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal5 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal6 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal7 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal8 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]verticaal9 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};

//alle waardes die in de sudoku komen te in de 3x3 vakjes
public int[]grid1 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid2 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid3 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid4 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid5 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid6 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid7 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid8 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};
public int[]grid9 = { -1, -1, -1, -1, -1, -1, -1, -1, -1};

//alle waardes gekeken vanaf links boven naar rechts onder dus: 
//1=s1, 2=s2, 3=s3, 4=s4, 5=s5, 6=s6, 7=s7, 8=s8, 9=s9
//10=s10 , 11=s11, 12=........... 
//etc
//de arrays geven de volgende dingen aan: naam = { de waarde van deze locatie in de sudoku, de verticale as waarin hij zit, de horizonatle  as waarin hij zit, het 3x3 blok waarin hij zit.
public int[]s1 = {horizontaal1[0], 1, 1, 1};
public int[]s2 = {horizontaal1[1], 2, 1, 1};
public int[]s3 = {horizontaal1[2], 3, 1, 1};
public int[]s4 = {horizontaal1[3], 4, 1, 2};
public int[]s5 = {horizontaal1[4], 5, 1, 2};
public int[]s6 = {horizontaal1[5], 6, 1, 2};
public int[]s7 = {horizontaal1[6], 7, 1, 3};
public int[]s8 = {horizontaal1[7], 8, 1, 3};
public int[]s9 = {horizontaal1[8], 9, 1, 3};
public int[]s10 = {horizontaal2[0], 1, 2, 1};
public int[]s11 = {horizontaal2[1], 2, 2, 1};
public int[]s12 = {horizontaal2[2], 3, 2, 1};
public int[]s13 = {horizontaal2[3], 4, 2, 2};
public int[]s14 = {horizontaal2[4], 5, 2, 2};
public int[]s15 = {horizontaal2[5], 6, 2, 2};
public int[]s16 = {horizontaal2[6], 7, 2, 3};
public int[]s17 = {horizontaal2[7], 8, 2, 3};
public int[]s18 = {horizontaal2[8], 9, 2, 3};
public int[]s19 = {horizontaal3[0], 1, 3, 1};
public int[]s20 = {horizontaal3[1], 2, 3, 1};
public int[]s21 = {horizontaal3[2], 3, 3, 1};
public int[]s22 = {horizontaal3[3], 4, 3, 2};
public int[]s23 = {horizontaal3[4], 5, 3, 2};
public int[]s24 = {horizontaal3[5], 6, 3, 2};
public int[]s25 = {horizontaal3[6], 7, 3, 3};
public int[]s26 = {horizontaal3[7], 8, 3, 3};
public int[]s27 = {horizontaal3[8], 9, 3, 3};
public int[]s28 = {horizontaal4[0], 1, 4, 4};
public int[]s29 = {horizontaal4[1], 2, 4, 4};
public int[]s30 = {horizontaal4[2], 3, 4, 4};
public int[]s31 = {horizontaal4[3], 4, 4, 5};
public int[]s32 = {horizontaal4[4], 5, 4, 5};
public int[]s33 = {horizontaal4[5], 6, 4, 5};
public int[]s34 = {horizontaal4[6], 7, 4, 6};
public int[]s35 = {horizontaal4[7], 8, 4, 6};
public int[]s36 = {horizontaal4[8], 9, 4, 6};
public int[]s37 = {horizontaal5[0], 1, 5, 4};
public int[]s38 = {horizontaal5[1], 2, 5, 4};
public int[]s39 = {horizontaal5[2], 3, 5, 4};
public int[]s40 = {horizontaal5[3], 4, 5, 5};
public int[]s41 = {horizontaal5[4], 5, 5, 5};
public int[]s42 = {horizontaal5[5], 6, 5, 5};
public int[]s43 = {horizontaal5[6], 7, 5, 6};
public int[]s44 = {horizontaal5[7], 8, 5, 6};
public int[]s45 = {horizontaal5[8], 9, 5, 6};
public int[]s46 = {horizontaal6[0], 1, 6, 4};
public int[]s47 = {horizontaal6[1], 2, 6, 4};
public int[]s48 = {horizontaal6[2], 3, 6, 4};
public int[]s49 = {horizontaal6[3], 4, 6, 5};
public int[]s50 = {horizontaal6[4], 5, 6, 5};
public int[]s51 = {horizontaal6[5], 6, 6, 5};
public int[]s52 = {horizontaal6[6], 7, 6, 6};
public int[]s53 = {horizontaal6[7], 8, 6, 6};
public int[]s54 = {horizontaal6[8], 9, 6, 6};
public int[]s55 = {horizontaal7[0], 1, 7, 7};
public int[]s56 = {horizontaal7[1], 2, 7, 7};
public int[]s57 = {horizontaal7[2], 3, 7, 7};
public int[]s58 = {horizontaal7[3], 4, 7, 8};
public int[]s59 = {horizontaal7[4], 5, 7, 8};
public int[]s60 = {horizontaal7[5], 6, 7, 8};
public int[]s61 = {horizontaal7[6], 7, 7, 9};
public int[]s62 = {horizontaal7[7], 8, 7, 9};
public int[]s63 = {horizontaal7[8], 9, 7, 9};
public int[]s64 = {horizontaal8[0], 1, 8, 7};
public int[]s65 = {horizontaal8[1], 2, 8, 7};
public int[]s66 = {horizontaal8[2], 3, 8, 7};
public int[]s67 = {horizontaal8[3], 4, 8, 8};
public int[]s68 = {horizontaal8[4], 5, 8, 8};
public int[]s69 = {horizontaal8[5], 6, 8, 8};
public int[]s70 = {horizontaal8[6], 7, 8, 9};
public int[]s71 = {horizontaal8[7], 8, 8, 9};
public int[]s72 = {horizontaal8[8], 9, 8, 9};
public int[]s73 = {horizontaal9[0], 1, 9, 7};
public int[]s74 = {horizontaal9[1], 2, 9, 7};
public int[]s75 = {horizontaal9[2], 3, 9, 7};
public int[]s76 = {horizontaal9[3], 4, 9, 8};
public int[]s77 = {horizontaal9[4], 5, 9, 8};
public int[]s78 = {horizontaal9[5], 6, 9, 8};
public int[]s79 = {horizontaal9[6], 7, 9, 9};
public int[]s80 = {horizontaal9[7], 8, 9, 9};
public int[]s81 = {horizontaal9[8], 9, 9, 9};

//in antwoord worden de antwoorden opgeslagen
public int[]antwoordt = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
//hierin woorden allen getallen die voor de sudoku nodig zijn bijgehouden
public int[]sallint = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
//Deze array geeft aan of een bepaalde waarde in sallint aangepast mag worden.
public boolean[]sallbool = {true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false};