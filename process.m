function [ret] = process(a,itimes,jtimes)
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
a11=a(1:itimes,1:jtimes);
a12=a(1:itimes,jtimes+1:2*jtimes);
a13=a(1:itimes,2*jtimes+1:3*jtimes);
a21=a(itimes+1:2*itimes,1:jtimes);
a22=a(itimes+1:2*itimes,jtimes+1:2*jtimes);
a23=a(itimes+1:2*itimes,2*jtimes+1:3*jtimes);
a31=a(2*itimes+1:3*itimes,1:jtimes);
a32=a(2*itimes+1:3*itimes,jtimes+1:2*jtimes);
a33=a(2*itimes+1:3*itimes,2*jtimes+1:3*jtimes);

[k11,n11]=imhist(a11);
[k12,n12]=imhist(a12);
[k13,n13]=imhist(a13);
[k21,n21]=imhist(a21);
[k22,n22]=imhist(a22);
[k23,n23]=imhist(a23);
[k31,n31]=imhist(a31);
[k32,n32]=imhist(a32);
[k33,n33]=imhist(a33);
b11=similar(k11,k22);
b12=similar(k12,k22);
b13=similar(k13,k22);

b21=similar(k21,k22);
b22=similar(k22,k22);
b23=similar(k23,k22);

b31=similar(k31,k22);
b32=similar(k32,k22);
b33=similar(k33,k22);
b=[b11,b12,b13;
   b21,b22,b23;
   b31,b32,b33;];

k=1/16*(k11+k13+k31+k33)+1/8*(k12+k21+k23+k32)+1/4*(k22)+b11*k11+b12*k12+b13*k13+b21*k21+b22*k22+b23*k23+b31*k31+b32*k32+b33*k33;
n=n33;
m1=100;
m2=100;
k1=k(1:m1);
k2=k(m1+1:m2);
k3=k(m2+1:256);
k1=k1./sum(k1);
k2=k2./sum(k2);
k3=k3./sum(k3);
for i=1:length(k1)-1
    k1(i+1)=k1(i+1)+k1(i);
end
for i=1:length(k2)-1;
    k2(i+1)=k2(i+1)+k2(i);
end
for i=1:length(k3)-1;
    k3(i+1)=k3(i+1)+k3(i);
end
k1=n(1)+(n(m1)-n(1)).*k1;
k2=n(m1+1)+(n(m2)-n(m1+1)).*k2;
k2=n(m2+1)+(n(256)-n(m2+1)).*k2;
k=[k1;k2;k3];
a=a22;
for i=1:size(a,1)
     for j=1:size(a,2)
         a(i,j)=k(find(a(i,j)==n));
     end
end
ret=a;
end
