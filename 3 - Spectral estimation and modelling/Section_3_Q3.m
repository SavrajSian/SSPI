

clear all
close all

load sunspot.dat    

spots = sunspot(:,2); %sunspots in 2nd col
spots= spots - mean(spots); %standardise
N = length(spots);
x =spots;

% biased ACF up to 10 lags
maxLag = N;
rxx = xcorr(x, maxLag, 'biased');
rxx = rxx(maxLag+1:end);


% LS estimates of  AR coefficients for different model orders p
for p = 1:10
    % H for the current order 
    H = toeplitz(rxx(1:p));
    
    % LS estimates 
    a_hat = inv(H' * H) * H' * rxx(2:p+1);
    
    disp(['Model Order = ', num2str(p), ': a_hat = ', num2str(a_hat','%.3f ')])

    

end
