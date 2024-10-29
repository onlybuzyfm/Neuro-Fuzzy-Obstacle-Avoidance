function result = rw_eval(SD)
min_dis=min(SD(1,1:3));
thetad=SD(1,4);

if min_dis== SD(1,1) && thetad > 0
    result = Case_1_R(min_dis, thetad);
elseif min_dis == SD(1,1) && thetad< 0
    result = Case_2_R(min_dis, thetad);
elseif min_dis == SD(1,3) && thetad > 0
    result = Case_3_R(min_dis, thetad);
elseif min_dis == SD(1,3) && thetad < 0
    result = Case_4_R(min_dis,thetad);
elseif min_dis == SD(1,2) && thetad > 0
    result = Case_5_R(min_dis, thetad);
elseif min_dis == SD(1,2) && thetad< 0
    result = Case_6_R(min_dis, thetad);
else
    result = NaN; % Devuelve NaN si ninguna condición se cumple
end
end