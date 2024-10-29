function result = lw_eval_NO(SD)
Lt_2=1.2;
v_max= 1;
LMr=381e-3;
R=195e-3;

Sf1 = -1;
haf = SD(1,4);
Lt_pf = round(Lt_2, 4);
V_pf = round(v_max, 4);
result = round((1 - ((LMr * haf * Sf1) / (2 * Lt_pf))) * (V_pf / R), 4);
end