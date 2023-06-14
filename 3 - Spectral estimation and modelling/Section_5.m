clear all
close all

load RRI1.mat
load RRI2.mat
load RRI3.mat

rri1 = RRI1;
rri2 = RRI2;
rri3 = RRI3;
rri1 = zscore(rri1);
rri2 = zscore(rri2);
rri3 = zscore(rri3);

stdPrri1 = pgm(rri1);
len1 = length(rri1);
xaxis1 = 0:1:len1-1;
xaxis1 = xaxis1/len1;

stdPrri2 = pgm(rri2);
len2 = length(rri2);
xaxis2 = 0:1:len2-1;
xaxis2 = xaxis2/len2;

stdPrri3 = pgm(rri3);
len3 = length(rri3);
xaxis3 = 0:1:len3-1;
xaxis3 = xaxis3/len3;

%standard periodogram - easier to see from 0 to 0.5
figure
plot(xaxis1, stdPrri1)
xlim([0 0.5])
xlabel('Normalised Frequency')
ylabel('PSD Estimate')

figure
plot(xaxis2, stdPrri2)
xlim([0 0.5])
xlabel('Normalised Frequency')
ylabel('PSD Estimate')

figure
plot(xaxis3, stdPrri3)
xlim([0 0.5])
xlabel('Normalised Frequency')
ylabel('PSD Estimate')



% averaged periodogram 40s

wind = 40*f1;

k = floor(length(rri2)/wind);
totalPrri = [];
for i=0:k-1
    segment = rri2((wind*i)+1:(wind*i)+wind);
    Px = pgm(segment);
    totalPrri(i+1,:) = Px;
end


wPrri = mean(totalPrri);
xaxis = 0:1:length(wPrri)-1;
xaxis = xaxis/length(wPrri);
figure
plot(xaxis, wPrri)
xlim([0 0.5])
xlabel('Normalised Frequency')
ylabel('PSD Estimate')


% averaged periodogram 100s

wind = 100*f1;

k = floor(length(rri2)/wind);
totalPrri = [];
for i=0:k-1
    segment = rri2((wind*i)+1:(wind*i)+wind);
    Px = pgm(segment);
    totalPrri(i+1,:) = Px;
end


wPrri = mean(totalPrri);
xaxis = 0:1:length(wPrri)-1;
xaxis = xaxis/length(wPrri);
figure
plot(xaxis, wPrri)
xlim([0 0.5])
xlabel('Normalised Frequency')
ylabel('PSD Estimate')




