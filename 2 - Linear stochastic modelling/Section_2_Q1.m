clear all
close all

x = randn(1000,1);
y=filter(ones(9,1),[1],x); %#ok<NBRAK2> 

[ccf,lag] = xcorr(x,y,'unbiased');

figure
stem(lag, ccf)
axis([-20 20 -1 2])
xlabel('Time lag')
ylabel('Correlation')
grid('on')

