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


figure
spectrogram(y,hann(8192),0,8192,32768, 'yaxis');
ylim([0,2]);


%{
figure
hold on
for i=0:2:20

Y = fft(y(8192*i+1:i*8192+8192));
f = (1:8192)*4;
plot(f,abs(Y),DisplayName=string(num(i/2 + 1)), LineWidth=0.5)
xlim([0 2000])
legend
xlabel('Frequency')
ylabel('Magnitude')
disp(i)

end 
%}

%{
xaxis = linspace(0,5.25,172032);
figure
plot(xaxis, y)
xlabel('Time (s)')
ylabel('Amplitude')
%}

