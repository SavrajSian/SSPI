clear all
close all
a = [1,0.9,0.2];
b = 1;

n = randn(10000,1);

x = filter(b,a,n);


[yo,eo,wo] = lms_ar(x,0.002,2); %original
[yse,ese,wse] = lms_sign_error(x,0.002,2); %signed-error
[ysr,esr,wsr] = lms_sign_regressor(x,0.002,2); %signed-regressor
[yss,ess,wss] = lms_sign_sign(x,0.002,2); %sign-sign


figure
plot(wo')
legend('a1', 'a2')
xlabel('Iteration')
ylabel('Coefficient value')
xlim([0 10000])

figure
plot(wse')
legend('a1', 'a2')
xlabel('Iteration')
ylabel('Coefficient value')
xlim([0 10000])

figure
plot(wsr')
legend('a1', 'a2')
xlabel('Iteration')
ylabel('Coefficient value')
xlim([0 10000])

figure
plot(wss')
legend('a1', 'a2')
xlabel('Iteration')
ylabel('Coefficient value')
xlim([0 10000])

woerr = sqrt((wo(1,end)+0.9)^2 + (wo(2,end)+0.2)^2)
wseerr = sqrt((wse(1,end)+0.9)^2 + (wse(2,end)+0.2)^2)
wsrerr = sqrt((wsr(1,end)+0.9)^2 + (wsr(2,end)+0.2)^2)
wsserr = sqrt((wss(1,end)+0.9)^2 + (wss(2,end)+0.2)^2)


%{
E = load('E.mat');
e = getaudiodata(E.recObj);
ecrop = e(24000:25000);

[y,e,w] = lms_ar(ecrop,0.1,5);
figure
plot(w')
xlabel('Iteration')
ylabel('Value')

[y,e,w] = lms_sign_error(ecrop,0.1,5);
figure
plot(w')
xlabel('Iteration')
ylabel('Value')

[y,e,w] = lms_sign_regressor(ecrop,0.1,5);
figure
plot(w')
xlabel('Iteration')
ylabel('Value')

[y,e,w] = lms_sign_sign(ecrop,0.1,5);
figure
plot(w')
xlabel('Iteration')
ylabel('Value')
%}

