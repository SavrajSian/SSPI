function[y, e, w, trackgains] = lms_ar(x, u, order)

    N = length(x);
    e = zeros(N,1);
    y = zeros(N,1);
    w = zeros(order, N);

    mu = u;
    mumin = 0.0005;

    prev_e = 0;
    beta = 0.01;
        trackgains = [];

    
    for i=order+1:N
        
        xtemp = x(i-1:-1:i-order); %x[n-1],x[n-2]
        y(i) = w(:,i)' * xtemp;
        e(i) = x(i) - y(i); %error uses x
        % Calculate difference
        e_diff = e(i) - prev_e;
        % Calculate gradient of error
        e_grad = e_diff / (i - order);
        % Adjust adaptation gain based on error gradient
        mu_adjust = beta * e_grad + (1-beta);
        mu = mu * mu_adjust;
        mu = max(mumin, mu);
        w(:, i+1) = w(:, i) + mu * e(i) * xtemp;
        % Store previous error for next iteration
        prev_e = e(i);
        w(:,i+1) = w(:,i) + u * e(i) * xtemp;
         trackgains = [trackgains mu];
    
    end

end


