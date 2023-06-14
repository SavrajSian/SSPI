
function pdf(v,n)

[counts,centers]=hist(v,n);
N = length(v);
width = abs(centers(2) - centers(1));

figure
bar(centers,(counts/(N*width)),'BarWidth',1)
hold on
ylim([0 1])
legend('Estimated PDF', 'Theoretical PDF')
xlabel('x')
ylabel('Probability Density')
end

%{
%for testing:
figure
histogram(v,50, "Normalization","pdf")
hold on
a = makedist("Normal");
plot(a);
%}