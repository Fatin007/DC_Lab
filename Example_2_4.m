% Example 2.4
% Generation of periodic sequences

n=0:5;
x=[1 1 2 -1 -1 0];
subplot(2,1,1);
stem(n,x,"filled");
grid on;
axis([0 20 -2 3]);
xlabel("n");
ylabel("x(n)");
title("Figure 2.4(a)");

xtilde = [x,x,x];
length_xtilde = length(xtilde);
n_new = 0:length_xtilde-1;
subplot(2,1,2);
h=stem(n_new,xtilde,"filled");
%h.MarkerFaceColor='b';
h.MarkerEdgeColor='r';
h.Color='g';
h.LineWidth=2;
grid on;
axis([0 20 -2 3]);
xlabel("n");
ylabel("perodic x(n)");
title("Figure 2.4(b)");
