function [k]=angle(x,y)
if x==0
    if y==0
        k=0;
    elseif y>0
        k=3;
    else 
        k=7;
    end
elseif x>0
    s=y/x;
    if s<1 && s>=0
        k=1;
    elseif s>=1 
        k=2;
    elseif s>=-1 && s<0
        k=8;
    else 
        k=7;
    end
else
    s=y/x;
    if s<-1
        k=3;
    elseif s>=-1 && s<0
        k=4;
    elseif s>=0 && s<1
        k=5;
    else 
        k=6;
    end
end
intensity=sqrt(x*x+y*y);
% if intensity<=1
%     k=0;
% end

%k=0 为分子分母都为0的情况 不存在的

    
        
    
        
