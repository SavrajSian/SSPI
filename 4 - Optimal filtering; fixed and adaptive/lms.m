function[y, e, w] = lms(x, z, u, order)

    N = length(x);
    e = zeros(N,1);
    y = zeros(N,1);
    w = zeros(order+1, N);
    
    for i=order+1:N % need enough space to go backwards
    
        xtemp = x(i:-1:i-order); %get all previous values needed
        y(i) = w(:,i)' * xtemp; 
        e(i) = z(i) - y(i);
        w(:,i+1) = w(:,i) + u * e(i) * xtemp;
    
    end

end








