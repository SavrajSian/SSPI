clear all
close all

load sunspot.dat    

spots = sunspot(:,2); %sunspots in 2nd col

sp5 = spots(1:5);
sp5_0mean = sp5 - mean(sp5);

sp20 = spots(1:20);
sp20_0mean = sp20 - mean(sp20);

sp250 = spots(1:250);
sp250_0mean = sp250 - mean(sp250);


[ACF5, lag5] = xcorr(sp5, 'unbiased');
[ACF5norm, lag5norm] = xcorr(sp5_0mean, 'unbiased');

[ACF20, lag20] = xcorr(sp20, 'unbiased');
[ACF20norm, lag20norm] = xcorr(sp20_0mean, 'unbiased');

[ACF250, lag250] = xcorr(sp250, 'unbiased');
[ACF250norm, lag250norm] = xcorr(sp250_0mean, 'unbiased');

figure
hold on
stem(lag5, ACF5, 'Color','r')
stem(lag5norm, ACF5norm, 'Color','b')
legend('ACF', 'Zero-mean ACF')
xlabel('Lag')
ylabel('Correlation')
grid on
hold off

figure
hold on
stem(lag20, ACF20, 'Color','r')
stem(lag20norm, ACF20norm, 'Color','b')
legend('ACF', 'Zero-mean ACF')
xlabel('Lag')
ylabel('Correlation')
grid on
hold off

figure
hold on
stem(lag250, ACF250, 'Color','r')
stem(lag250norm, ACF250norm, 'Color','b')
legend('ACF', 'Zero-mean ACF')
xlabel('Lag')
ylabel('Correlation')
grid on
hold off


figure
hold on
stem(lag250, ACF250, 'Color','r')
stem(lag250norm, ACF250norm, 'Color','b')
legend('ACF', 'Zero-mean ACF')
xlim([-75 75])
xlabel('Lag')
ylabel('Correlation')
grid on
hold off

disp(mean(sp5))
