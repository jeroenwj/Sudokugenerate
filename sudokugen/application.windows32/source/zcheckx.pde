int[] checkX(int r, boolean Unique) {  //<>// //<>//
  for (int j = 0; j<9; j++) { 
    if (!Unique) {
      if (x==1) {
        if (verticaal1[j]==r) {
          bevatwelx = 1;
        } else if (verticaal1[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==2) {
        if (verticaal2[j]==r) {
          bevatwelx = 1;
        } else if (verticaal2[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==3) {
        if (verticaal3[j]==r) {
          bevatwelx = 1;
        } else if (verticaal3[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==4) {
        if (verticaal4[j]==r) {
          bevatwelx = 1;
        } else if (verticaal4[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==5) {
        if (verticaal5[j]==r) {
          bevatwelx = 1;
        } else if (verticaal5[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==6) {
        if (verticaal6[j]==r) {
          bevatwelx = 1;
        } else if (verticaal6[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==7) {
        if (verticaal7[j]==r) {
          bevatwelx = 1;
        } else if (verticaal7[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==8) {
        if (verticaal8[j]==r) {
          bevatwelx = 1;
        } else if (verticaal8[j]!=r) {
          bevatnietx += 1;
        }
      } else if (x==9) {
        if (verticaal9[j]==r) {
          bevatwelx = 1;
        } else if (verticaal9[j]!=r) {
          bevatnietx += 1;
        }
      }
    }
    //if (Unique) {
    //  if (x==1) {
    //    if (verticaal1[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal1[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==2) {
    //    if (verticaal2[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal2[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==3) {
    //    if (verticaal3[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal3[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==4) {
    //    if (verticaal4[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal4[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==5) {
    //    if (verticaal5[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal5[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==6) {
    //    if (verticaal6[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal6[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==7) {
    //    if (verticaal7[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal7[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==8) {
    //    if (verticaal8[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal8[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  } else if (x==9) {
    //    if (verticaal9[j]==r) {
    //      bevatwelunx = 1;
    //    } else if (verticaal9[j]!=r) {
    //      bevatnietunx += 1;
    //    }
    //  }
    //  int[] tempx = new int[2];
    //  tempx[0]=bevatwelunx;
    //  tempx[1]=bevatnietunx;
    //  return tempx;
    //}
  }

  int[] tempx = new int[2];
  tempx[0]=bevatwelx;
  tempx[1]=bevatnietx;
  return tempx;
}