b = input('Input: ');
n = length(b);
t = 0:.01:n;
for i = 1:n
    bw(i*100:(i+1)*100) = b(i);
end
bw = bw(100:end);
subplot(2,1,1);
plot(t,bw);
grid on ;
hold on;
for i = 0.5:0.5:n
    plot([1 1]*i, [-2 2], 'LineWidth',.5, 'Color',[0 0 0 0.3], 'LineStyle','--');
end
hold off;
axis([0 n -2 +2]);
ll=0.5:1:n;
xticks(ll)
xticklabels(b)
