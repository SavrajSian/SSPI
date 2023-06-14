function [y, e, w, trackgains] = lms_gearshift(x, z, init_gain, order)

    N = length(x);
    e = zeros(N, 1);
    y = zeros(N, 1);
    w = zeros(order+1, N);
    mu = init_gain;
    mumin = 0.0005;
    mumax = 0.1;   

    prev_e = 0;
    beta = 0.01;
    trackgains = [];
  
    for i = order+1:N
        xtemp = x(i:-1:i-order);
        y(i) = w(:, i)' * xtemp;
        e(i) = z(i) - y(i);
        % Difference
        e_diff = e(i) - prev_e;
        % Gradient
        e_grad = e_diff / (i - order);
        % Adjust adaptation gain based on error gradient
        mu_adjust = beta * e_grad + (1-beta);
        mu = mu * mu_adjust;
        mu = max(mumin, mu);
        w(:, i+1) = w(:, i) + mu * e(i) * xtemp;
        % Store previous error for next iteration
        prev_e = e(i);
        trackgains = [trackgains mu];
    end
end
