clear all
close all

load('RRI1.mat') %1st trial
load('RRI2.mat')
load('RRI3.mat')

rri1 = RRI1;
rri1 = detrend(rri1);
rri2 = RRI2;
rri2 = detrend(rri2);
rri3 = RRI3;
rri3 = detrend(rri3);

[acf1, lag1] = xcorr(rri1, 'unbiased');
[acf2, lag2] = xcorr(rri2, 'unbiased');
[acf3, lag3] = xcorr(rri3, 'unbiased');



figure
plot(lag1, acf1./(acf1(ceil(end/2)))); %scale to have magnitude 1 at lag 0
xlabel('Lag')
ylabel('ACF')
xlim([-700, 700])

figure
plot(lag2, acf2./(acf2(ceil(end/2))));
xlabel('Lag')
ylabel('ACF')
xlim([-700, 700])


figure
plot(lag3, acf3./(acf3(ceil(end/2))));
xlabel('Lag')
ylabel('ACF')
xlim([-700, 700])

