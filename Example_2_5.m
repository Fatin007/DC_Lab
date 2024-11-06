% Example 2.5
% signal addition using sigadd function

function [y,n] = sigadd(x1,n1,x2,n2)
    l=min(min(n1),min(n2));
    r=max(max(n1),max(n2));
    n=l:r;
    y1=zeros(1,length(n));
    y2=zeros(1,length(n));

    y1((n>=min(n1)) & (n<=max(n1))) = x1;
    y2((n>=min(n2)) & (n<=max(n2))) = x2;

    y=y1+y2;
end

n1 = 0:10;
x1 = sin(n1);
n2 = -5:7;
x2 = 4*sin(n2);
[y,n] = sigadd(x1,n1,x2,n2);
% add function

subplot(3,1,1);
stem(n1,x1);
axis([-6 11 -5, 5]);
title('1st signal');

subplot(3,1,2);
stem(n2,x2);
axis([-6 11 -5, 5]);
title('2nd signal');

subplot(3,1,3);
stem(n,y);
axis([-6 11 -5, 5]);
title('Added signal');