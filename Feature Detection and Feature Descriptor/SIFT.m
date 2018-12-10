function [Q,count,spot]=SIFT(Q,spot,x,y,a,b,Ix,Iy,count)
% new=Q;
count=count+1;
Q1=zeros(16,16);
Q2=zeros(16,16);
% disp('cc');
if (x-7)<0 || (y-7)<0 || (x+8)>a || (y+8)>b
    spot(x,y)=0;   %但调试发现没有角点落在这里面  
    %disp('jajaa')
else
    for i=(x-7) : (x+8)
        for j=(y-7) : (y+8)
            Q1((i-(x-8)),(j-(y-8)))=Ix(i,j);
            Q2((i-(x-8)),(j-(y-8)))=Iy(i,j);
        end
    end
    for i=0:3
        for m= (i*4+1) : (i*4+4)
            for j=0:3
                for n=(j*4+1):(j*4+4)
                    k=angle(Q1(m,n),Q2(m,n));
                    if k==0
                        k=0;
%                         return  只有有一个k=0  就跳出这个函数了  肯定是不对的 因为其他的点没有遍历到

                    else Q(count,(i*4+j+1),k)=Q(count,(i*4+j+1),k)+1;
                    end
                end
            end
        end
    end
end
% disp('bb');
% new=Q;
%         
    