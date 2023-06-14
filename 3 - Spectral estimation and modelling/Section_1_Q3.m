clear all
close all

x = randn(1024, 1);
totalPx = [];

for i=0:7
    segment = x((128*i)+1:(128*i)+128);
    Px = pgm(segment);
    totalPx(i+1,:) = Px;
    
end

xaxis = 0:127;
xaxis = xaxis/128;

meanPx = mean(totalPx);
disp(mean(meanPx))
disp(var(meanPx))

figure
stem(xaxis, meanPx)
xlabel('Normalised frequency')
ylabel('PSD estimate')


