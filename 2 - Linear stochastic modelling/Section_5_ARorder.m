clear all
close all

load('RRI1.mat') %1st trial
load('RRI2.mat')
load('RRI3.mat')

rri1 = RRI1;
rri1 = zscore(rri1);
rri2 = RRI2;
rri2 = zscore(rri2);
rri3 = RRI3;
rri3 = zscore(rri3);

PCF = [];
MDL = [];
AIC = [];
AIcc = [];
N = length(rri3);
for i=1:5
    [a, e, k] = aryule(rri3, i);
    PCF = [PCF, -k(i)];
    MDL(i) = log(e) + (i*log(N))/N;
    AIC(i) = log(e) + (2*i)/N;
    AICc(i) = AIC(i) + ((2*i)*(i+1))/(N-i-1);
end

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
