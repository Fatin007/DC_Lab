clear;
clc;
b = [0 1 0 0 1 1 1 0];
n = length(b);
t = 0:.01:n;
for i = 1:n
    if (b(i) == 0)
        bw(i*100:(i+1)*100) = 1;
    else
        bw(i*100:(i+1)*100) = -1;
    end
end

bw = bw(100:end);
subplot(2,1,1)
plot(t,bw,LineWidth=1.5, Color=[0 0 0 .8]);
grid on ;
axis([0 n -2 +2])