clear all
close all

load sunspot.dat    

spots = sunspot(:,2); %sunspots in 2nd col
zspots = spots - mean(spots); %0 mean


%pyulear uses yule-walker to calc PSD - quicker to use function
%p=1,2,5 


%non-normalised
[p1, w1]= pyulear(spots,1);
[p2, w2]= pyulear(spots,2);
[p10, w10]= pyulear(spots,10);
px = pgm(spots);
xaxis = 0:length(px)-1;
xaxis = xaxis/length(px);

figure
hold on
plot(w1/(2*pi),p1, Color='r', DisplayName='Model order 1 based PSD')
plot(w2/(2*pi),p2, Color='g', DisplayName='Model order 2 based PSD')
plot(w10/(2*pi),p10, Color='b', DisplayName='Model order 10 based PSD')
plot(xaxis(2:end), px(2:end), Color=[1, 0.75, 0.15], DisplayName='Periodogram')
hold off
xlim([0,0.5])
xlabel('Normalised frequency')
ylabel('Amplitude')
legend

%zero mean
[zp1, zw1]= pyulear(zspots,1);
[zp2, zw2]= pyulear(zspots,2);
[zp10, zw10]= pyulear(zspots,10);
px = pgm(spots);
xaxis = 0:length(px)-1;
xaxis = xaxis/length(px);

figure
hold on
plot(zw1/(2*pi),zp1, Color='r', DisplayName='Model order 1 based PSD')
plot(zw2/(2*pi),zp2, Color='g', DisplayName='Model order 2 based PSD')
plot(zw10/(2*pi),zp10, Color='b', DisplayName='Model order 10 based PSD')
plot(xaxis(2:end), px(2:end), Color=[1, 0.75, 0.15], DisplayName='Periodogram')
hold off
xlim([0,0.5])
xlabel('Normalised frequency')
ylabel('Amplitude')
legend
