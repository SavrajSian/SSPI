clear all
close all

load sunspot.dat    
spots = zscore(sunspot(:,2)); %standardise
N = length(spots); %288

MDL = [];
AIC = [];
AICc = []*20;
err = [];



for i=1:20
    [a, e, k] = aryule(spots, i);
    err(i) = log(e);
 
    MDL(i) = log(e) + (i*log(N))/N;
    AIC(i) = log(e) + (2*i)/N;
    AICc(i) = AIC(i) + ((2*i)*(i+1))/(N-i-1);
end


figure
grid on
hold on
plot(MDL)
plot(AIC)
plot(AICc)
plot(err)
legend('MDL', 'AIC', 'AICc', 'Error')
xlabel('Model order')
xlim([0, 14])


