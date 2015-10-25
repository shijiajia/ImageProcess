clc
p2=imread('P2.jpg');
figure(111111)
imshow(p2)
% figure(1111);
% imshow(p2);
% figure(222);
% p1=rgb2hsv(p2)
% imhist(p1(:,:,3));
% size(p2)
% figure(5)
% p2=imadjust(p2,[0.3,0.7],[0,1]);
% figure(333);
% imshow(p2)
% p2(:,:,3)=adapthisteq(p2(:,:,3),'NumTiles',[10,10],'ClipLimit',0.01)
% % p2=imadjust(p2,[0.4,0.7],[0,1]);
% figure(2222);
% imshow(p2)
% figure(333)
% imhist(p2(:,:,3))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%。。GHE。。%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% p1=rgb2hsv(p2);
% a=p1(:,:,3);
% [k,n]=imhist(a);
% k=k./sum(k);
% for i=1:255
%     k(i+1)=k(i+1)+k(i);
% end
% for i=1:size(a,1)
%     for j=1:size(a,2)
%         a(i,j)=k(find(a(i,j)==n));
%     end
% end
% figure(5)
% imhist(a);
% p1(:,:,3)=a;
% figure(4)
% imshow(hsv2rgb(p1));
% figure(12)
% imshow(imadjust(hsv2rgb(p1),[0,1],[0,1]));
% figure(122)
% p1=imadjust(p1,[0,1],[0.3,1]);
% imhist(p1(:,:,3));
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%。。BHE。。%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% p1=rgb2hsv(p2);
% a=p1(:,:,3);
% [k,n]=imhist(a);
% k1=k(1:80);
% k2=k(81:160);
% k3=k(161:256)
% k1=k1./sum(k1)
% k2=k2./sum(k2)
% k3=k3./sum(k3)
% for i=1:length(k1)-1
%     k1(i+1)=k1(i+1)+k1(i);
% end
% for i=1:length(k2)-1;
%     k2(i+1)=k2(i+1)+k2(i);
% end
% for i=1:length(k3)-1;
%     k3(i+1)=k3(i+1)+k3(i);
% end
% k1=n(1)+(n(80)-n(1)).*k1;
% k2=n(81)+(n(160)-n(81)).*k2;
% k3=n(161)+(n(256)-n(161)).*k3;
% k=[k1;k2;k3];
% for i=1:size(a,1)
%      for j=1:size(a,2)
%          a(i,j)=k(find(a(i,j)==n));
%      end
% end
% p1(:,:,3)=a;
% figure(13)
% imshow(hsv2rgb(p1));
% figure(133)
% imhist(p1(:,:,3));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%。。AHE。。%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%div%%%%%
p1=rgb2hsv(p2);
a=p1(:,:,3);
width=size(a,2);
height=size(a,1);
if mod(width,2)==1 
    width=width-1;
end
if mod(height,2)==1
    height=height-1;
end
b=zeros(height*2,width*2);
b(0.5*height+1:1.5*height,0.5*width+1:1.5*width)=a(1:height,1:width);
% figure(1)
% imshow(b(0.5*height+1:1.5*height,0.5*width+1:1.5*width));
b(0.5*height+1:1.5*height,1:0.5*width)=a(1:height,0.5*width:-1:1);
b(0.5*height+1:1.5*height,1.5*width+1:2*width)=a(1:height,width:-1:0.5*width+1);
b(1:0.5*height,1:2*width)=b(height:-1:0.5*height+1,1:2*width);
b(1.5*height+1:2*height,1:2*width)=b(1.5*height:-1:height+1,1:2*width);
width=width*2;
height=height*2;
ik=12;
jk=16;
itimes=round(height/ik);
jtimes=round(width/jk);
%imshow(b(0.5*height/2+1:1.5*height/2,0.5*width/2+1:1.5*width/2));
%%%%process%%
processed=zeros(size(b,1),size(b,2));
for i=2:ik-1
    for j=2:jk-1
        %imshow(b((i-1)*itimes+1:i*itimes,(j-1)*jtimes+1:j*jtimes))
        %processed((i-1)*itimes+1+floor(1/2*itimes):(i+1)*itimes-floor(1/2*itimes),(j-1)*jtimes+1+floor(1/2*jtimes):(j+1)*jtimes-floor(1/2*jtimes))=processa(b((i-1)*itimes+1:(i+1)*itimes,(j-1)*jtimes+1:(j+1)*jtimes),itimes,jtimes);
        b((i-1)*itimes+1:i*itimes,(j-1)*jtimes+1:j*jtimes)=process(b((i-2)*itimes+1:(i+1)*itimes,(j-2)*jtimes+1:(j+1)*jtimes),itimes,jtimes);
    end
end

%a=processed(0.5*height/2+1:1.5*height/2+1,0.5*width/2+1:1.5*width/2);
a=b(0.5*height/2+1:1.5*height/2+1,0.5*width/2+1:1.5*width/2);
% for i=2:size(a,1)-1
%     for j=2:size(a,2)-1
%         a(i,j)=1/4*a(i,j)+1/8*(a(i-1,j)+a(i,j-1)+a(i,j+1)+a(i+1,j))+1/16*(a(i-1,j-1)+a(i-1,j+1)+a(i+1,j-1)+a(i+1,j+1));
%     end
% end
p1(:,:,3)=a(1:size(p1(:,:,3),1),1:size(p1(:,:,3),2));
%p1(:,:,3)=adapthisteq(p1(:,:,3));
%p1(:,:,3)=medfilt2(p1(:,:,3),[3,3]);     
%p1(:,:,3)=histeq(p1(:,:,3));
figure(33)
imhist(p1(:,:,3))
figure(14)
p1=hsv2rgb(p1);
imshow(p1);
% imshow(imadjust(p1,[0,1],[0,0.7]));

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

