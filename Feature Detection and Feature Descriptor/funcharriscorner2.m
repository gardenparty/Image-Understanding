function [spot]=funcharriscorner2(img)
disp(img);
I=imread(img);
a=size(I,1);
b=size(I,2);
I=rgb2gray(I);
fx=[-2,-1,0,1,2];
fy=[-2;-1;0;1;2];
Ix=filter2(fx,I);
Iy=filter2(fy,I);
% intensity=sqrt(Ix.*Ix+Iy.*Iy);
Ix2=Ix.*Ix;
Iy2=Iy.*Iy;
Ixy=Ix.*Iy;
g=fspecial('gaussian',[6,6],1);
Ix2=filter2(g,Ix2);
Iy2=filter2(g,Iy2);
Ixy=filter2(g,Ixy);
ret=ones(7,7);    %那个窗口函数的w大小
Ix2=filter2(ret,Ix2);
Iy2=filter2(ret,Iy2);
Ixy=filter2(ret,Ixy);
Det=Ix2.*Iy2-Ixy.*Ixy;
Trace=Ix2+Iy2;
R=Det-0.05*(Trace.*Trace);
Rmax=0;
for i=1:a
    for j=1:b
        if R(i,j)>Rmax
            Rmax=R(i,j);
        end
    end
end
Inew=zeros(a,b);
count=0;
n=10;   %最大抑制的窗口大小
for i=(1+n):(a-n)
    for j=(1+n):(b-n)
        if i == 608 && j == 79
            blabla = 1;
        end
        idx=compareall(R,i,j,n);  %最大抑制的实现函数
        %if R(i,j)>0.01*Rmax && idx
        if idx
            Inew(i,j)=1;
            count=count+1;
        end
    end
end
for i = 1:a
    for j = 1:b
        if Inew(i,j)~=1
            R(i,j)=0;
        end
    end
end

disp(count);
sz=size(R);
R=reshape(R,1,sz(1)*sz(2));
[arr,idx]=sort(R);  
spot=zeros(1,sz(1)*sz(2));
spot(idx((sz(1)*sz(2)-400):(sz(1)*sz(2))))=1;
spot=reshape(spot,sz(1),sz(2));
% 你这个排序需要注意啊 直接对R排序导致最大抑制方法没用上啊  而且最大抑制循环是从1+n出发的 这都是之前sort排序错误的来源
%[posc,posr]=find(Inew==1);
[posc,posr]=find(spot==1);
fff=size(posc,1)
imshow(I);
hold on;
plot(posr,posc,'r.');