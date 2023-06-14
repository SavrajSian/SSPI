

x = randn(1000,1);
figure
stem(x);
xlabel('Samples');
ylabel('x[n]');

samplemean = mean(x);
disp(['sample mean: ', num2str(samplemean)]);
samplestd = std(x);
disp(['sample std ', num2str(samplestd)]);

x_10 = randn(1000,10);
smeans = zeros(1,10);
sstds = zeros(1,10);

for i =1:10
    smeans(i) = mean(x_10(:,i));
    sstds(i) = std(x_10(:,i));
end

mbias = 0-smeans;
disp(['bias: ', num2str(mbias)]);
sbias = 1-sstds;

meanmbias = mean(mbias)
meansbias = mean(sbias)

figure
stem(smeans);
xlabel('Realisation number')
ylabel('Sample mean')
ylim()
yline(0, 'red')
grid on 

figure
stem(sstds)
xlabel('Realisation number')
ylabel('Sample standard deviation')
ylim([0.9,1.1])
yline(1, 'red')
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



y = randn(10000,1); %more samples


figure
histogram(x,50, 'Normalization','pdf');
xlabel('x')
ylabel('Density')

grid on
hold on
z = makedist("Normal", 0, 1);
plot(z)
hold off



figure
histogram(y,50,'Normalization','pdf');
xlabel('x')
ylabel('Density')

grid on
hold on
z = makedist("Normal", 0, 1);
plot(z)
hold off
