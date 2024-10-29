clc;clear;close all;
C1_LR=readfis('C1_Mamdani.fis');

W=evalfis(C1_LR,[0.3 0.5 0.6 0.5]);

Wr=W(2);

Wl=W(1);