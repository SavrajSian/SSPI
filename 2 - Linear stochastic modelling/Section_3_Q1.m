clear all
close all

len = 100;

a1 = -2.5 + 5*rand(len,1);
a2 = -1.5 + 3*rand(len,1);


stablex = [];
stabley = [];
unstablex = [];
unstabley = [];

for i=1:len %inclusive both ends
    if(a1(i) + a2(i) < 1 && a2(i) - a1(i) < 1 && (-1<a2(i) && a2(i)<1) )
        stablex(end+1) = a1(i);
        stabley(end+1) = a2(i);
    

    else
        unstablex(end+1) = a1(i);
        unstabley(end+1) = a2(i);


    end

end

hold on
plot(stablex, stabley, '*', 'Color','r')
plot(unstablex, unstabley, '*', 'Color', 'b')
legend('stable', 'unstable')
xlabel('a1')
ylabel('a2')
