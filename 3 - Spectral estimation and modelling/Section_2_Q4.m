clear all
close all

x = randn(1064, 1);

y = filter(1, [1, 0.9], x);%b,a,x
y = y(41:end);

[ry, l] = xcorr(y, 'unbiased');

lag1= find(l==1);
lag0 = find(l==0);

a1 = -ry(lag1)/ry(lag0);
var = ry(lag0) + (a1*ry(lag1));

[h,w]=freqz(var,[1,a1],512);

Py = pgm(y);
xaxis = 0:length(Py)-1;
xaxis = xaxis/length(Py);

[thh,thw] = freqz([1],[1 0.9],512);

figure
plot(w/(2*pi),abs(h).^2, LineWidth=1);
hold on
plot(xaxis, Py, Color=[0.7150 0.0780 0.1840])
plot(thw/(2*pi),abs(thh).^2, LineWidth=1);
xlim([0.4, 0.5])
xlabel('Normalised frequency')
ylabel('Amplitude')
legend('Model based PSD', 'Periodogram', 'Theoretical PSD')