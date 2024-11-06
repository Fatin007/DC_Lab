% example 2.3
% Generation of random sequence

n=0:10;
x=rand(1,length(n));
y=randn(1,length(n));
%  subplot(2,1,1);
plot(n,x);
grid on;
hold on;
% subplot(2,1,2);
plot(n,y,"r");
ylabel("x & y");
xlabel("n");
title("Figure 2.3");