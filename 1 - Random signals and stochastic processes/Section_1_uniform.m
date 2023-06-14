clear all
close all

x = rand(1000,1);
figure
stem(x);
xlabel('Samples');
ylabel('x[n]');

%Q1

theoreticalmean = 0.5; %uniform dist between 0 and 1, therefore mean should be in the middle at 0.5
disp(['theoretical mean: ', num2str(theoreticalmean)]);
samplemean = mean(x);
disp(['sample mean: ', num2str(samplemean)]);

%Q2

theoreticalstd = sqrt((1-0)^2/12); %formula for uniform = sqrt((b-a)^2/12))
disp(['theoretical std: ', num2str(theoreticalstd)]);
samplestd = std(x);
disp(['sample std ', num2str(samplestd)]);

%Q3

x_10 = rand(1000,10);
smeans = zeros(1,10);
sstds = zeros(1,10);

for i =1:10
    smeans(i) = mean(x_10(:,i));
    sstds(i) = std(x_10(:,i));
end

mbias = 0.5-smeans;
disp(['bias: ', num2str(mbias)]);
sbias = 0.28868-sstds;



figure
stem(smeans);
xlabel('Realisation number')
ylabel('Sample mean')
ylim([0.45 0.55])
yline(0.5, 'red')
grid on 

figure
stem(sstds)
xlabel('Realisation number')
ylabel('Sample standard deviation')
ylim([0.25 0.3])
yline(0.28868, 'red')
grid on 

figure
stem(mbias);
xlabel('Realisation number')
ylabel('Bias')
grid on 

figure
stem(sbias);
xlabel('Realisation number')
ylabel('Bias')
grid on 



%Q4

y = rand(10000,1); %more samples


figure
histogram(x,10, 'Normalization','pdf');
xlabel('x')
ylabel('Density')
yline(1, 'red')
grid on

figure
histogram(x,100, 'Normalization','pdf');
xlabel('x')
ylabel('Density')
yline(1, 'red')
grid on


figure
histogram(y,10,'Normalization','pdf');
xlabel('x')
ylabel('Density')
yline(1, 'red')
grid on

figure
histogram(y,100,'Normalization','pdf');
xlabel('x')
ylabel('Density')
yline(1, 'red')
grid on

