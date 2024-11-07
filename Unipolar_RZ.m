clear;
clc;
b=input('Input: ');
n=length(b);
t=0:0.01:n;

for i=1:n
    if(b(i)==1)
        bw(i*100:(i+.5)*100)=1;
        bw((i+.5)*100:(i+1)*100)=0;
    else
        bw(i*100:(i+1)*100)=0;
    end
end
bw=bw(100:end);
plot(t,bw,LineWidth=1.5);
axis([0 n -2 2]);
grid on;
hold on;
for i = 0.5:0.5:n
    plot([1 1]*i, [-2 2], 'LineWidth',.5, 'Color',[0 0 0 0.3], 'LineStyle','--');
end
hold off;

ll = 0.5:1:n;
xticks(ll)
xticklabels(b);
