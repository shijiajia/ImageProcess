min=999999999999999;
Vmax=15;
Vmin=2;
L1=2000;
L2=3000;
L3=5000;
alph=7318;
beta=1401300;
dl=1;
for m=1:100
    v=[];
    v1=[];
    v2=[];
    v(1)=Vmax;
    for i=1:L1-1
%         mm=v(i)-0.07*v(i)*v(i)-0.11*v(i)+0.194;
%         if (mm<Vmin)
%             vend=Vmin;
%         else
%             vend=mm;
%         end
        v(i+1)=-rand()*0.2+v(i);
    end
    v1(1)=v(L1);
    for i=1:L2-L1-1
%         mm=v(i)+0.07*v(i)*v(i)+0.11*v(i)-0.194;
%         if (mm>Vmax)
%             vend=Vmax;
%         else
%             vend=mm;
%         end
        v1(i+1)=rand()*0.2+v1(i);
    end
    v2(1)=v1(L2-L1);
    for i=1:L3-L2-1
%         mm=v(i)-0.07*v(i)*v(i)-0.11*v(i)+0.194;
% %         if (mm<0)
% %             vend=0;
% %         else
% %             vend=mm;
% %         end
     v2(i+1)=-rand()*0.2+v2(i);
    end
    
    v=[v,v1,v2];
    k=7381*v.*v.*dl+1401300.*dl.*v;
    
    if sum(k)<min
        min=sum(k);
        vv=v;
    end
    
end
x=0:L3-1;
plot(x,vv);
