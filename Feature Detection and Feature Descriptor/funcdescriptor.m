function [Q,spot]=funcdescriptor(img)
%spot=imread('spot.jpg'); 
%spot��ֱ�ӵ���harriscorner2.m�õ��ı���  ��Ȼ��Ҳ������һ���������õ�  
%����ֱ�ӽ��������ͼ���У���Ϊ�漰������Ķ���������ֵ��ı�
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
%ע�����ϲ�û���ø�˹����ƽ��
[x,y]=find(spot==1);
length=size(x,1);
Q=zeros(length,16,8);
count=0;
for i = 1:length
    [Q,count,spot]=SIFT(Q,spot,x(i),y(i),a,b,Ix,Iy,count);
end

