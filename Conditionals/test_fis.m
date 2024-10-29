
C1_L_Test=readfis('C1_L.fis');

C1_R_Test=readfis('C1_R.fis');


WR_test=evalfis(C1_R_Test,[0.1 0.1 0.05 0.1]);

WL_test=evalfis(C1_L_Test,[0.1 0.1 0.05 0.1]);