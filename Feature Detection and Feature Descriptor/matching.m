%img1="comp1.jpg";
%img2="comp2.jpg";   注意不能用"  "引用 imread会报错    要用' '
img1='pin1.jpg';
img2='pin2.jpg';
[Q1,spot1]=funcdescriptor(img1);
[Q2,spot2]=funcdescriptor(img2);
num1=size(Q1,1);
num2=size(Q2,1);
Q1=reshape(Q1,num1,128);
Q2=reshape(Q2,num2,128);
ret=zeros(1,num2);
for i = 1: num1
    for j=1:num2
        ret(j)=dis(Q1(i,:),Q2(j,:));
    end
        [val,inx]=sort(ret);
        kankan(i)=val(1);
        xishu(i)=inx(1);
        match(i)=0;

end
[aaa,bbb]=sort(kankan);
for i=1:50
    match(bbb(i))=xishu(bbb(i));
end

I1=imread(img1);
I2=imread(img2);
I1=rgb2gray(I1);
I2=rgb2gray(I2);
% [x1,y1]=size(I1);
% [x2,y2]=size(I2);  %我们假设y1与y2是一样的
new=[I1 I2];
figure;
imshow(new);
hold on;
[x1,y1]=find(spot1==1);
[x2,y2]=find(spot2==1);
for i=1:num1
    if match(i)~=0
        yk(1)=x1(i);
        xk(1)=y1(i);
        yk(2)=x2(match(i));
        xk(2)=y2(match(i))+2048;
        plot(xk,yk,'r');
        hold on;
    end
end

        
        
        
        




