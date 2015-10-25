function [b] = similar(a,b)
%SIMILAR Summary of this function goes here
%   Detailed explanation goes here
a=a./sum(a);
b=b./sum(b);
x=1-sum(abs(a-b));
y1=exp(-((x-0.15)./0.1)^2);
y2=exp(-((x-0.35)./0.1)^2);
y3=exp(-((x-0.75)./0.1)^2);
if (y1>y2&&y1>y3) 
    b=1/16;
end
if (y2>y1&&y2>y3) 
    b=1/8;
end
if (y3>y1&&y3>y2) 
    b=1/4;
end
  
end
