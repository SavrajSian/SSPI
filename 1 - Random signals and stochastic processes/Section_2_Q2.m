clear all
close all


v1 = rp1(4,1000); 
v2 = rp2(4,1000);
v3 = rp3(4,1000);

meanv1 = mean(v1,2);
meanv2 = mean(v2,2);
meanv3 = mean(v3,2);

stdv1 = std(v1,0,2);
stdv2 = std(v2,0,2);
stdv3 = std(v3,0,2);






figure
hold on
grid on
stem(meanv1,'LineStyle','none','Color','#228B22');
stem(meanv2,'LineStyle','none','Color','red');
stem(meanv3,'LineStyle','none','Color','blue');
xlabel('Realisation');
ylabel('Mean')
set(gca,'xtick', 1:1:4);
legend('rp1','rp2','rp3')
hold off

figure
hold on
grid on
stem(stdv1,'LineStyle','none','Color','#228B22');
stem(stdv2,'LineStyle','none','Color','red');
stem(stdv3,'LineStyle','none','Color','blue');
xlabel('Realisation');
ylabel('Standard deviation')
set(gca,'xtick', 1:1:4);
legend('rp1','rp2','rp3')
hold off