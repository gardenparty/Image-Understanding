function [s]=compareall(R,a,b,n)
Q=ones((2*n+1),(2*n+1));
s=1;
test = R((a-n):(a+n), (b-n):(b+n));
for i=(a-n):(a+n)
    for j=(b-n):(b+n)
        if i == 607 && j == 79
            bllablablabla = 1;
        end
        if i~=a || j~=b
            if R(a,b)<=R(i,j)
                s=0;
            end
        end
    end
end
ffffff = 1;
% s=1;
% for i=1:(2*n+1)
%     for j=1:(2*n+1)
%         s=s && Q(i,j)  ;
%     end
% end
% end
            

