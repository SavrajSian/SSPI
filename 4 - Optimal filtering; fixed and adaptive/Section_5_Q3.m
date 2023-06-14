close all

E = load('E2.mat');
A = load('A2.mat');
S = load('S2.mat');
T = load("T2.mat");
X = load("X2.mat");
e = getaudiodata(E.recObj);
a = getaudiodata(A.recObj);
s = getaudiodata(S.recObj);
t = getaudiodata(T.recObj);
x = getaudiodata(X.recObj);

ecrop = e(7000:8000);
acrop = a(10300:11300);
scrop = s(8500:9500);
tcrop = t(9600:10600);
xcrop = x(7000:8000);


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

