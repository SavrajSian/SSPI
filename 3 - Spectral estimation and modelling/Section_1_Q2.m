clear all
close all

x = randn(1024, 1);

for i=0:7
    segment = x((128*i)+1:(128*i)+128);
    Px = pgm(segment);
    xaxis = 0:127;
    xaxis = xaxis/128;
    subplot(2,4,i+1)
    stem(xaxis, Px)
    xlabel('Normalised frequency')
    ylabel('PSD estimate')
    fprintf('segment %d - mean: %.4f: Var: %.4f \n', i+1, mean(Px), var(Px) ) ;
end