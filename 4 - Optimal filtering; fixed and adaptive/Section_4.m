clear all
close all

a = [1,0.9,0.2];
b = 1;

n = randn(1000,1);

x = filter(b,a,n);

gains = [0.005, 0.01, 0.05, 0.1];

for i=1:4

[y,e,apred] =lms_ar(x, gains(i), 2);

a1 = apred(1,:);
a2 = apred(2,:);

figure
hold on
plot(a1)
plot(a2)

legend('a1', 'a2')
xlabel('Iteration')
ylabel('Coefficient value')
xlim([0 1000])
hold off


end

