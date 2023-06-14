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

MSE = zeros(1, 10);
for p = 1:10
    H = toeplitz(rxx(1:p));
    
    a_hat = inv(H' * H) * H' * rxx(2:p+1);
    
    disp(['Model Order = ', num2str(p), ': a_hat = ', num2str(a_hat','%.3f ')])

    x_pred = filter([0 a_hat'], 1, x);
    
    MSE(p) = mean((x - x_pred).^2);

 

end



figure
plot( MSE)
xlabel('Model Order')
ylabel('MSE')
