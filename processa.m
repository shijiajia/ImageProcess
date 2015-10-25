function [ret] = processa(b,itimes,jtimes)
%PROCESSA Summary of this function goes here
%   Detailed explanation goes here

a11=b(1:itimes,1:jtimes);
a12=b(1:itimes,jtimes+1:2*jtimes);
a21=b(itimes+1:2*itimes,1:jtimes);
a22=b(itimes+1:2*itimes,jtimes+1:2*jtimes);

[k11,n11]=imhist(a11);
[k12,n12]=imhist(a12);
[k21,n21]=imhist(a21);
[k22,n22]=imhist(a22);
k11=k11./sum(k11);
for i=1:255
    k11(i+1)=k11(i)+k11(i+1);
end
k12=k12./sum(k12);
k21=k21./sum(k21);
k22=k22./sum(k22);
for i=1:255
    k12(i+1)=k12(i)+k12(i+1);
end
for i=1:255
    k22(i+1)=k22(i)+k22(i+1);
end
for i=1:255
    k21(i+1)=k21(i)+k21(i+1);
end
x1=floor(1/2*itimes);
x2=floor(3/2*itimes);
y1=floor(1/2*itimes);
y2=floor(3/2*jtimes);
n=n22;

% index=find(n==b(i,j))
% f00=k11(index);
% f01=k12(index);
% f11=k21(index);
% f10=k22(index);
for i=x1:x2
    for j=y1:y2
        for k=1:256
            if n(k)>b(i,j)
                index=k-1;
                break
            end
        end
       
        f00=k11(index)*0.7;
        f01=k12(index)*0.7;
        f11=k21(index)*0.7;
        f10=k22(index)*0.7;
  
        b(i,j)=f00*(1-i/itimes)*(1-j/jtimes)+f01*(1-i/itimes)*j/jtimes+f11*i/itimes*j/jtimes+f10*i/itimes*(1-j/jtimes);
    end
end
ret=b(floor(1/2*itimes)+1:2*itimes-floor(1/2*itimes),floor(1/2*jtimes)+1:2*jtimes-floor(1/2*jtimes));
end
