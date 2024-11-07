clear;
clc;
b = [0 1 1 0 1 0 1];
n = length(b);
t = 0:0.01:n;

lastbit = 1;
for i = 1:n
    if(b(i) == 0)
        bw(i*100:(i+1)*100) = lastbit;
        lastbit = -lastbit;
    else
        bw(i*100:(i+1)*100) = 0;
    end
end

bw = bw(100:end);

subplot(2,1,1);
plot(t,bw);
axis([0 n -2 2]);
grid on;