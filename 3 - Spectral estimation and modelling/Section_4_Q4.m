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


%add noise

y1 = randn(1,172032)*0.2 + y;
y2 = randn(1,172032)*1 + y;
y3 = randn(1,172032)*6 + y;

xaxis = linspace(0,5.25,172032);

figure
plot(xaxis,y)
xlim([0.23 0.26])
xlabel('Time (s)')
ylabel('Amplitude')

figure
plot(xaxis,y1)
xlim([0.23 0.26])
xlabel('Time (s)')
ylabel('Amplitude')

figure
plot(xaxis,y2)
xlim([0.23 0.26])
xlabel('Time (s)')
ylabel('Amplitude')

figure
plot(xaxis,y3)
xlim([0.23 0.26])
xlabel('Time (s)')
ylabel('Amplitude')

figure
spectrogram(y,hann(8192),0,8192,32768, 'yaxis');
ylim([0,2]);

figure
spectrogram(y1,hann(8192),0,8192,32768, 'yaxis');
ylim([0,2]);

figure
spectrogram(y2,hann(8192),0,8192,32768, 'yaxis');
ylim([0,2]);

figure
spectrogram(y3,hann(8192),0,8192,32768, 'yaxis');
ylim([0,2]);




%{
xaxis = linspace(0,5.25,172032);
figure
plot(xaxis, y)
xlabel('Time (s)')
ylabel('Amplitude')
%}