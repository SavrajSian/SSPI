
clear all
close all


v1 = rp1(100,100); 
v2 = rp2(100,100);
v3 = rp3(100,100);

meanv1 = mean(v1);
meanv2 = mean(v2);
meanv3 = mean(v3);

stdv1 = std(v1);
stdv2 = std(v2);
stdv3 = std(v3);

figure
hold on
grid on
plot(meanv1);
plot(meanv2);
plot(meanv3);
xlabel('Time');
ylabel('Mean')
legend
hold off

figure
hold on
grid on
plot(stdv1);
plot(stdv2);
plot(stdv3);
xlabel('Time');
ylabel('Standard deviation')
legend
hold off
