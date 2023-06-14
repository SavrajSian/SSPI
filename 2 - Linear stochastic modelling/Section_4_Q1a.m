clear all
close all

load NASDAQ.mat

prices = NASDAQ.Close;
normprices = zscore(prices);
time = NASDAQ.Date;
N = length(normprices);

PCF = [];
MDL = [];
AIC = [];
AIcc = [];
for i=1:20
    [a, e, k] = aryule(normprices, i);
    PCF = [PCF, -k(i)];
    MDL(i) = log(e) + (i*log(N))/N;
    AIC(i) = log(e) + (2*i)/N;
    AICc(i) = AIC(i) + ((2*i)*(i+1))/(N-i-1);
    

end

%[pacf, lags] = parcorr(normprices); %checking

figure
grid on
hold on
stem(PCF)
conf = 1.96/sqrt(N);
plot(xlim,[1 1]'*[-conf conf], '--', 'Color',[0.2, 0.7, 0.2], 'HandleVisibility','off', 'LineWidth',0.8)
xlabel('Lag')
ylabel('Partial ACF')
hold off

figure
grid on
hold on
plot(MDL)
plot(AIC)
plot(AICc)
xlabel('Model order')
legend('MDL', 'AIC', 'AICc')
