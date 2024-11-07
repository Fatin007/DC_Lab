% Example 2.1
% Generation of sinusoidal signals
% 2sin( 2πt-π/2)

t=-5:0.01:5;
x=2*sin(2*pi*t-pi/2);
plot(t,x);
grid on;
axis([-6 6 -3 3]);
ylabel("x(t)");
xlabel("Time(sec)");
title("Figure 2.1");
