clear;
clc;
b = [0 1 0 0 1 1 1 0];
n = length(b);
t = 0:0.001:n;

lastbit = 1;
for i = 1:n
    if(b(i) == 1)
       bw(i*1000:(i+0.5)*1000) = lastbit;
       bw((i+0.5)*1000:(i+1)*1000) = -lastbit;
       lastbit = -lastbit;
    else
       bw(i*1000:(i+0.5)*1000) = -lastbit;
       bw((i+0.5)*1000:(i+1)*1000) = lastbit;
       
    end
end
bw = bw(1000:end);
subplot(1,1,1)
plot(t,bw);
hold on;
for i = 1:n
    plot([1 1]*i, [-2 2]);
end
hold off;


axis([0 n -2 2]);
grid on;
xLabelArray = 0.5:1:n;
anotherlabelArray = 0:1:n;
xticks(xLabelArray)
xticklabels(b)
title('Differential Manchester Coding');
