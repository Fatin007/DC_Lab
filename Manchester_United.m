clear;
clc;

b = input("Input: ");
n=length(b);
t=0:0.001:n;

for i=1:n
    if(b(i)==1)
        bw(i*1000:(i+0.5)*1000)=-1;
        bw((i+0.5)*1000:(i+1)*1000)=1;
    else
        bw(i*1000:(i+0.5)*1000)=1;
        bw((i+0.5)*1000:(i+1)*1000)=-1;
    end
end

bw=bw(1000:end);
plot(t,bw);
title('Manchester Encoding');
grid on;
axis([0 n -2 2]);

ll=0.5:1:n;
xticks(ll);
xticklabels(b);
