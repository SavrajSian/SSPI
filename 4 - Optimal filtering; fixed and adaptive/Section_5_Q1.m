close all

E = load('E.mat');
A = load('A.mat');
S = load('S.mat');
T = load("T.mat");
X = load("X.mat");
e = getaudiodata(E.recObj);
a = getaudiodata(A.recObj);
s = getaudiodata(S.recObj);
t = getaudiodata(T.recObj);
x = getaudiodata(X.recObj);

ecrop = e(24000:25000);
acrop = a(25000:26000);
scrop = s(21000:22000);
tcrop = t(27600:28600);
xcrop = x(18500:19500);

%{
figure
hold on
plot(ecrop)
plot(acrop)
plot(scrop) 
plot(xcrop)
plot(tcrop)
hold off    
%}
%
N=1000;


perfe = [];
for i=1:20
[y,e,w] = lms_ar(ecrop,1,i);

varin = var(ecrop);
varerr = var(e);

predgain = 10*log10(varin/varerr);
perfe = [perfe predgain];
end


figure
hold on
plot(perfa)
plot(perfe)
plot(perft)
plot(perfx)
plot(perfs)
hold off
legend('a','e','t','x','s')
ylabel('Prediction gain')
xlabel('Order')





%{
figure
hold on
plot(y)
plot(ecrop)
hold off
legend('Model prediction', 'Real wave')

xlabel('Sample number')
ylabel('Amplitude')
xlim([0 1000])
%}


%{
figure
plot(w')
xlabel('Iteration')
ylabel('Value')
[y,e,w] = lms_ar(ecrop,6,10);
figure
plot(w')
xlabel('Iteration')
ylabel('Value')
[y,e,w] = lms_ar(ecrop,10,10);
figure
plot(w')
xlabel('Iteration')
ylabel('Value')

%}