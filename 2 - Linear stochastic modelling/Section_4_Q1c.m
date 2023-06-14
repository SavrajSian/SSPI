clear all
close all

load NASDAQ.mat

prices = NASDAQ.Close;
normprices = zscore(prices);
time = NASDAQ.Date;

sigCRLB = zeros(21, 21);
a1CRLB = zeros(20,20);
i = 1;
j = 1;

N=1:50:1001; %1 to 1001 in increments of 50
truevar = 1:50:1001;
a1 = -1:0.1:1; %a1 from -1 to 1 (sensible range for a1)


[rxx, e] = aryule(normprices, 1); %rxx for AR(1)
[corr, lags] = xcorr(normprices, 'unbiased');
rxx0 = corr(923);



for i=1:21
    for j = 1:21

        sigCRLB(i, j) = (2*truevar(i)^2)/N(j);
        a1CRLB(i, j) = (1-a1(i)^2)/N(j);
    end
end

figure
h = heatmap(N, truevar, log(sigCRLB));
h.Colormap= winter;s
h.XLabel = 'N';
h.YLabel = 'sigma^2';


figure
h2 = heatmap(N, a1, log(a1CRLB));
h2.Colormap= winter;
h2.XLabel = 'N';
h2.YLabel = 'a1';


