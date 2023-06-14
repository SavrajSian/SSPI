clear all
close all

x = randn(1000,1);

y = filter([1,2,3,2,1], 1, x); %Nw=4: w[0,1,2,3,4]
ym = mean(y);
yv = std(y);
y = (y); 

n = randn(1000,1)*0.1; %noise s.d=0.1
z = y+n;


gains = [0.004, 0.01, 0.1];

for i=1:3

[y,e,w]=lms(x, z, gains(i), 4);

w1 = w(1,:);
w2 = w(2,:);
w3 = w(3,:);
w4 = w(4,:);
w5= w(5,:);

%{
figure
hold on
plot(w1)
plot(w2)
plot(w3)
plot(w4)
plot(w5)
legend('w1', 'w2', 'w3', 'w4', 'w5')
xlabel('Iteration')
ylabel('Weight value')
xlim([0 1000])
%}

figure
hold on
plot(e.^2)
xlabel('Iteration')
ylabel('Error')

end