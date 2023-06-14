clear all
close all

load sunspot.dat    
spots = sunspot(:,2); 
normspots = zscore(spots);

%unnormalised
[a10, e10, k10] = aryule(spots, 10);

%normalised
[an10, en10, kn10] = aryule(normspots, 10);



figure
hold on
grid on
stem(-k10, 'Color','b')
stem(-kn10, 'Color','r')
xlabel('Lag')
ylabel('Partial ACF')
legend('Unnormalised', 'Normalised')
conf = 1.96/sqrt(288);
plot(xlim,[1 1]'*[-conf conf], '--', 'Color',[0.2, 0.7, 0.2], 'HandleVisibility','off', 'LineWidth',0.8)
legend('Unnormalised', 'Normalised')


%{
%check using k is same - it is
c = [];
for i=1:10
    [a,e,k] = aryule(normspots,i);
    c = [c -a(end)];
end

figure
stem(c)
%}


