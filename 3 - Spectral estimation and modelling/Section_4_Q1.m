close all
clear all

load frequencies.mat

s = 0:9;
r = randsample(s,8);

num = [0,2,0,r];

sfreq = 32768;
sampperiod = 1/sfreq;
tonelen = sfreq*0.25;

time = linspace(0,0.25,tonelen); %do all these mults at once

y = [];

for i=1:11
    tone = sin(2 * pi * freqs(1,num(i)+1) * time)+sin(2 * pi * freqs(2,num(i)+1) * time);
    idle = zeros(1,tonelen);
    disp(num(i))
    disp(freqs(1,num(i)+1))
    disp(freqs(2,num(i)+1))
    if(i ~= 11)
        y = [y tone idle];
    end
    if(i==11) %dont need silence at end
        y = [y tone];
    end
end

xaxis = linspace(0,5.25,172032);

figure
plot(xaxis, y)
xlim([5 5.01])
xlabel('Time (s)')
ylabel('Amplitude')


