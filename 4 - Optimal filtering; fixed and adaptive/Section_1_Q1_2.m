clear all
close all

x = randn(1000,1);

y = filter([1,2,3,2,1], 1, x); %Nw=4: w[0,1,2,3,4]
ym = mean(y);
yv = std(y);
y = zscore(y); %variance 1

sd = [sqrt(0.25), 1, sqrt(2), sqrt(4), sqrt(7), sqrt(10)];

for i=1:6

n = randn(1000,1)*sd(i); %noise s.d
z = y+n;

zSNR = snr(z,n);

[ccf,lag] = xcorr(z,x,'unbiased');
cent = find(lag==0);
edge = find(lag==4);
Pzx = ccf(cent:cent+4);


[rxx, lag2] = xcorr(x, 'unbiased');
cent2 = find(lag2==0);
rxx = rxx(cent2:cent2+4);

Rxx = toeplitz(rxx);


wopt = inv(Rxx)*Pzx;

wopt2 = wopt * yv + ym;

fprintf('var: %.1f, SNR: %.4f dB, coeffs: [%s]\n', sd(i), zSNR, num2str(wopt2', '%.4f '));


end


