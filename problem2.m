f=1;
A=1;
T=1/f;
t=0:0.001:5*T;

composite=zeros(size(t));

for k=1:2:9
    x=A*sin(2*pi*k*f*t);
    composite=composite+x; 
    
    subplot(6,1,(k+1)/2);
    plot(t,x);
    axis([0,5*T,-A,A]);
    grid on;
end

subplot(6,1,6);
plot(t,composite);
axis([0,5*T,-5*A,5*A]);
grid on;