clear all
close all



N = [128, 256, 512];


for i=1:3
    x = randn(N(i),1);
    Px = pgm(x);
    xaxis = 0:1:N(i)-1;
    xaxis = xaxis/N(i);
    figure
    stem(xaxis, Px)
    xlabel('Normalised frequency')
    ylabel('PSD estimate')


end

