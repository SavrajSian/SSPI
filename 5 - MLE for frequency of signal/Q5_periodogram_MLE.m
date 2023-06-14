clear all
close all

f0 = 0.25;
n = 0:9;

x = cos(2*pi*f0*n);

[p,w]=periodogram(x);
xaxis = linspace(0,0.5,129);

MLE = [];

for f=0.01:0.01:0.49

    c = cos(2*pi*f*n)';
    s = sin(2*pi*f*n)';
    H = [c s];
    x2 = cos(2*pi*f0*n)';
    MLE = [MLE x2'*H*inv(H'*H)*H'*x2];

end
xaxis2 = 0.01:0.01:0.49;



figure
hold on
plot(w/(2*pi), p)
plot(xaxis2, MLE)
legend('Periodogram', 'MLE estimate')
xlabel('Normalised frequency')
ylabel('Amplitude')
