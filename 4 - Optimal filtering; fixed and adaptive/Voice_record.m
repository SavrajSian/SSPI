clear all
close all

Fs=16000;
N=1000;

recObj = audiorecorder(Fs,16,1);
disp('start recording')
recordblocking(recObj, 1);
disp('finished recording')
play(recObj);
e = getaudiodata(recObj);

plot(e)

save('X2.mat', "recObj")

