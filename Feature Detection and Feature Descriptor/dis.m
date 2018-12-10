function [s]=dsitance(a,b)
s=0;
for i=1:128
    s=s+abs(a(i)-b(i))*abs(a(i)-b(i));
end
%s=sqrt(s);
end