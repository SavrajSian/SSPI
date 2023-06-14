clear all
close all

load sunspot.dat
sun=sunspot(:, 2);
sun = zscore(sun);


horizons = [1, 2, 5, 10];


%AR(p)
a = ar(sun, 10, 'yw'); %inputs: data, order, method(yule walker)
m1 = predict(a, sun, 1);
m2 = predict(a, sun, 2);
m5 = predict(a, sun, 5);
m10 =predict(a, sun, 10);

figure
plot(sun)
hold on
plot(m1)
hold off
xlabel('N')
legend('Actual Data', 'Predicted Data')

figure
plot(sun)
hold on
plot(m2)
hold off
legend('Actual Data', 'Predicted Data')


figure
plot(sun)
hold on
plot(m5)
hold off
legend('Actual Data', 'Predicted Data')


figure
plot(sun)
hold on
plot(m10)
hold off
legend('Actual Data', 'Predicted Data')



