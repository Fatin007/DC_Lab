clear;
clc;

b=input('Input: ');
n=length(b);
t=0:0.001:n;

lastbit=1;
for i=1:n
    if(b(i)==1)
        bw(i*1000:(i+0.5)*1000)=lastbit;
        bw((i+0.5)*1000:(i+1)*1000)=-lastbit;
        lastbit=-lastbit;
    else
        bw(i*1000:(i+0.5)*1000)=-lastbit;
        bw((i+0.5)*1000:(i+1)*1000)=lastbit;
    end
end

bw=bw(1000:end);
plot(t,bw, 'LineWidth',1.5, 'Color', '#00ff00')
grid on;
axis([0 n -2 2]);
hold on;
for i = 0.5:0.5:n
    plot([1 1]*i, [-2 2], 'LineWidth',.5, 'Color',[0 0 0 0.3], 'LineStyle','--');
end
hold off;

ll=0.5:1:n;
xticks(ll)
xticklabels(b);


