% x=0:0.05:1.5;
% a=0.05;
% b=0.95;
% y1=(x-a)./(b-a);
% y1(x<a)=0;
% y1(x>b)=1;
% %subplot(1,3,1);
% plot(x,y1,'-.k','LineWidth',1.5);
% hold on
% y2=0.5+0.5*sin(3.14/(b-a).*(x-(a+b)/2));
% y2(x<a)=0;
% y2(x>b)=1;
% %subplot(1,3,2);
% plot(x,y2,'k','LineWidth',2);
% hold on
% y3=((x-a)./(b-a)).^2;
% y3(x<a)=0;
% y3(x>b)=1;
% %subplot(1,3,3);
% plot(x,y3,':k','LineWidth',2);
% axis([0,1.1,0,1.1]);
% grid on
% legend('Trapezoid distribution','2nd parabolic distribution','Ridge distribution');
% xlabel('Similarity degree');
% ylabel('Influence factor');
x=0:0.01:1;
y1=exp(-((x-0.15)./0.1).^2);
y2=exp(-((x-0.45)./0.1).^2);
y3=exp(-((x-0.75)./0.1).^2);
plot(x,y1,':k',x,y2,'-.k',x,y3,'k','LineWidth',2);
legend('The membership function of A','The membership function of B','The membership function of C')
xlabel('Degree of similarity')
ylabel('Degree of membership')
grid on