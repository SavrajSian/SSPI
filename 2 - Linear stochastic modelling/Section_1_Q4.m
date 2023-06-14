clear all
close all

x = randn(1000,1);
y=filter(ones(9,1),[1],x); %#ok<NBRAK2> 
z=filter(ones(5,1),[1],x); %#ok<NBRAK2> 


[acf,lag] = xcorr(y, 'unbiased');

figure
stem(lag, acf)
axis([-20 20 -3 10])
xlabel('Time lag')
ylabel('Correlation')
grid('on')

[zacf,zlag] = xcorr(z, 'unbiased');

figure
stem(zlag, zacf)
axis([-20 20 -3 10])
xlabel('Time lag')
ylabel('Correlation')
grid('on')





