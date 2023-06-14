function[y, e, w] = lms_sign_error(x, u, order)

    N = length(x);
    e = zeros(N,1);
    y = zeros(N,1);
    w = zeros(order, N);
    
    for i=order+1:N
        
        xtemp = x(i-1:-1:i-order); %prev samples
        y(i) = w(:,i)' * xtemp;
        e(i) = x(i) - y(i); %error uses x
        w(:,i+1) = w(:,i) + u * sign(e(i)) * xtemp;
    
    end

end


