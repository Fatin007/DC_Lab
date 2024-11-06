clear;
clc;
b = [0 1 1 0 1 0 1];
n = length(b);
t = 0:0.01:n;

lastbit = -1;
for i = 1:n
    if(b(i) == 0)
        bp(i) = -lastbit;
        lastbit = -lastbit;
    else
        bp(i) = 0;
    end
end

for i = 1:n
    bw(i*100:(i+1)*100) = bp(i);
end
bw = bw(100:end);

subplot(3,1,1);
plot(t,bw);
axis([0 n -2 2]);
grid on;