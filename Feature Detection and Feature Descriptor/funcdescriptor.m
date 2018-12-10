function [Q,spot]=funcdescriptor(img)
%spot=imread('spot.jpg'); 
%spot是直接调用harriscorner2.m得到的变量  当然你也可以用一个函数来得到  
%不能直接将数组存在图像中，因为涉及到编码的东西，数组值会改变
spot=funcharriscorner2(img);
I=imread(img);
I=rgb2gray(I);
a=size(I,1);
b=size(I,2);
fx=[-2,-1,0,1,2];
fy=[-2;-1;0;1;2];
Ix=filter2(fx,I);
Iy=filter2(fy,I);
sum=sqrt(Ix.*Ix+Iy.*Iy);
average=mean(sum(:))
%注意以上并没有用高斯进行平滑
[x,y]=find(spot==1);
length=size(x,1);
Q=zeros(length,16,8);
count=0;
for i = 1:length
    [Q,count,spot]=SIFT(Q,spot,x(i),y(i),a,b,Ix,Iy,count);
end

