clear all
close all



N = [128, 256, 512];

a = 1;
b = 0.2*[1 1 1 1 1];


for i=1:3
    x = randn(N(i),1);
    Px = pgm(x);
    Px_smooth = filter(b, a, Px);
    xaxis = 0:1:N(i)-1;
    xaxis = xaxis/N(i);
    %figure
    %stem(xaxis, Px)
    %xlabel('Normalised frequency')
    %ylabel('PSD estimate')
    figure
    stem(xaxis, Px_smooth)
    xlabel('Normalised frequency')
    ylabel('PSD estimate')
  
end

