Am=5;
Ac=5; 
fc=10*f;
fs=2000;
t=0:1/fs:1;

subplot(3,1,1);
xm=Am*sin(2*pi*f*t);
plot(t,xm);
title("Message Signal");

xc=Ac*sin(2*pi*fc*t);
subplot(3,1,2);
plot(t,xc);
title("Carrier Signal");

y=(Ac+Am*(sin(2*pi*f*t))).*sin(2*pi*fc*t);
subplot(3,1,3);
plot(t,y);
title("Modulated Signal");