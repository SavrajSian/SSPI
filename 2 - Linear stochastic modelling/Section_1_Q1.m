clear all
close all

x = randn(1000,1);
[acf,lag] = xcorr(x, 'unbiased');

figure
plot(lag, acf);
axis([-999 999 -1 1.2]);
xlabel('Time Lag')
ylabel('Correlation')
grid('on')

figure
plot(lag, acf);
axis([-50 50 -1 1.2]);
xlabel('Time Lag')
ylabel('Correlation')
grid('on')