clear all
close all

x = randn(1064, 1);

y = filter(1, [1, 0.9], x);%b,a,x
y = y(41:end);

figure
plot(x)
xlabel('Sample')
ylabel('Amplitude')


figure
plot(y)
xlabel('Sample')
ylabel('Amplitude')


