clear all
close all

load sunspot.dat    

spots = sunspot(:,2); %sunspots in 2nd col
spots= spots - mean(spots); %standardise

int = [10:5:250];
z = length(int);

p=2;

MSE = zeros(z);
for k = 1:z

    x =spots(1:int(k));
    N = length(x);
        
    rxx = xcorr(x, 'biased');
    rxx = rxx(N+1:end);
    
   
    H2 = toeplitz(rxx(1:end-1), rxx(1:p));
    
    a_hat = inv(H2' * H2) * H2' * rxx(2:end);
    
    %disp(['Model Order = ', num2str(p), ': a_hat = ', num2str(a_hat','%.3f ')])
    
     x_pred = filter(1, a_hat, x);
    
    % MSE between original and predicted 
    MSE(k,1) = mean((x - x_pred).^2);
    MSE(k,2) = int(k);
        
end

figure
plot(MSE(:,2),MSE(:,1) )
xlabel('Data length')
ylabel('MSE')

sys = ar(x(1:250), 2, '')