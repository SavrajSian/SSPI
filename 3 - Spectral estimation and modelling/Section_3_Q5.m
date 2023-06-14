
clear all
close all

load sunspot.dat    

spots = sunspot(:,2); %sunspots in 2nd col
spots= spots - mean(spots); %standardise
N = length(spots);
x =spots;

maxLag = N;
rxx = xcorr(x, maxLag, 'biased');
rxx = rxx(maxLag+1:end);

a = [];

for p = 1:10
    H = toeplitz(rxx(1:p));
    
    a_hat = inv(H' * H) * H' * rxx(2:p+1);
    
    disp(['Model Order = ', num2str(p), ': a_hat = ', num2str(a_hat','%.3f ')])

     a(p,1:p) = a_hat; % Store estimated coefficients in matrix
    
end

figure;
hold on
for i=1:5
    [h,w]=freqz(1,[1,-a(i, 1:i)],512);
    plot(w/(2*pi),abs(h).^2, LineWidth=1);
end
hold off
legend('Model order 1', 'Model order 2', 'Model order 3', 'Model order 4', 'Model order 5')
xlabel('Normalised frequency')
ylabel('Amplitude')

figure
p=2;
ap = [1,-a(p,1:p)];
[H3,W3]=freqz(1,ap,N); 
plot(W3/(2*pi),abs(H3).^2, LineWidth=1);