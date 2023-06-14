clear all
close all

ecg2 = readmatrix("ecg_s2.csv");
ecgcol2 = ecg2(:,3);
fs = 500; %sample freq=500Hz

%figure 
%plot(ecgcol2)

trial1 = ecgcol2(1000:125000);
trial2 = ecgcol2(150000:250000); 
trial3 = ecgcol2(275000:375000);
%figure
%plot(trial3)


[RRI1, f1] = ECG_to_RRI(trial1, fs);
[RRI2, f2] = ECG_to_RRI(trial2, fs);
[RRI3, f3] = ECG_to_RRI(trial3, fs);

save('RRI1.mat','RRI1', 'f1');
save('RRI2.mat','RRI2', 'f2');
save('RRI3.mat','RRI3', 'f3');

