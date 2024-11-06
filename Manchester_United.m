clear;
clc;
b = [1 0 1 0 1 1 0 1];
%b = [0 1 1 0 1 0 1];
n = length(b);
t = 0:0.001:n;
lastbit = -1;
for i = 1:n
    if(b(i) == 1)
        bw(i*1000:(i+0.5)*1000) = -1;
        bw((i+0.5)*1000:(i+1)*1000) = 1;
       
    else
        bw(i*1000:(i+0.5)*1000) = 1;
        bw((i+0.5)*1000:(i+1)*1000) = -1;
        lastbit = -1;
    end
end
bw = bw(1000:end);
% subplot(3,1,1)
plot(t,bw);
grid on;
axis([0 n -2 2]);