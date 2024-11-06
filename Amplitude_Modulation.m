Am=5; % Amp of modulating signal
Ac=5; % Amp of carrier signal
m=1; % Modulation Index
f=10;
fc=10*f;
fs=2000;
t=0:1/fs:1;

% Modulating signal
subplot(3,1,1);
xm=Am*sin(2*pi*f*t);
plot(t,xm);
title("Message Signal");

% carrier
xc=Ac*sin(2*pi*fc*t);
subplot(3,1,2);
plot(t,xc);
title("Carrier Signal");

% Modulated
y=Ac+Am*(1+m*sin(2*pi*f*t)).*sin(2*pi*fc*t);
subplot(3,1,3);
plot(t,y);
title("Modulated Signal");