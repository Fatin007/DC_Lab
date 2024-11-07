clear;
clc;
b = input('Input: ');
n = length(b);
t = 0:.001:n;
for i = 1:n
    if (b(i) == 0)
        b_p(i) = 0;
    else
        b_p(i) = 1;
    end
end
for j = 1:n
    bw(j*1000:(j+1)*1000) = b_p(j);
end
bw = bw(1000:end);
subplot(2,1,1)
plot(t,bw)
axis([0 n -2 2]);
grid on;
lastbit = 1;
for i=1:n
    if b(i)==1
        x(i*1000:(i+1)*1000) = lastbit;
        lastbit = -lastbit;
    else 
        x(i*1000:(i+1)*1000) = 0;
    end
end
x = x(1000:end);
subplot(2,1,2)
plot(t,x)
axis([0 n -2 2]);
grid on;
hold on;
for i=0.5:0.5:n
    plot([1 1]*i, [-2 2], LineWidth=.3, Color=[0 0 0 0.3], LineStyle="--");
end

ll=0.5:1:n;
xticks(ll)
xticklabels(b)
title('Bipolar AMI');