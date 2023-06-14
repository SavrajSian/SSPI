clear all
close all

load('RRI1.mat') %1st trial

rri = RRI1;
N = length(rri);

hr = 60./rri;
figure
plot(hr)

figure
histogram(hr,50, "Normalization","pdf");
xlabel('Heart rate')
ylabel('Probability')


%avg

avghr = [];
curr = 0;
alpha = 0.6;

for i=1:N
    curr = curr + alpha*hr(i);
    rem = mod(i, 10);
    if(rem == 0)
        avghr(i/10) = curr/10;
        curr = 0;
    end
end

figure
histogram(avghr,50, "Normalization","pdf");
xlabel('Heart rate')
ylabel('Probability')

