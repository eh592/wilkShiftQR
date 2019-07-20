%script to save time running

H = hilb(4);
D = diag(15:-1:1) + ones(15,15);


fprintf(1,'\n hilb(4) unshifted \n')
[evalH, convH] = driver_unshiftedqralg(H);
pause
fprintf(1,'\n hilb(4) wilk. shifted \n')
[evalD, convD] = driver_wilkqralg(H);
pause
fprintf(1,'\n D unshifted \n')
[evalH, convH] = driver_unshiftedqralg(D); %1.6519
pause 
fprintf(1,'\n D wilk. shifted \n')
[evalD, convD] = driver_wilkqralg(D);
pause