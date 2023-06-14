clear all
close all

x = randn(1064, 1);

y = filter(1, [1, 0.9], x);%b,a,x
y = y(41:end);


[h,w] = freqz([1],[1 0.9],512);
Py = pgm(y);
xaxis = 0:length(Py)-1;
xaxis = xaxis/length(Py);



figure
plot(w/(2*pi),abs(h).^2, LineWidth=1);
hold on
plot(xaxis, Py, Color=[0.7150 0.0780 0.1840])
xlim([0.4, 0.5])
xlabel('Normalised frequency')
ylabel('Amplitude')
legend('True PSD', 'Periodogram')

