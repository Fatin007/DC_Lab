%Phase Modulation
t=0:0.005:1;
% carrier
fc=10;
xc=sin(2*pi*fc*t);
subplot(3,1,1);
plot(t,xc);
title("Carrier");
% message
fm=20;
xm=sin(2*pi*fm*t);
subplot(3,1,2);
plot(t,xm);
title("Carrier");
% Modulated
phaseDev=pi/2;
tx=pmmod(xc,fc,fm,phaseDev);
subplot(3,1,3);
plot(t,tx);
title("Modulated");
