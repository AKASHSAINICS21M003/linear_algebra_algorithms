n=input('enter the dimension value')
a=zeros(n,n);
for i=1:n
    for j=1:n
        a(i,j)=input('enter the value')
    end
end    
hra(a)% HOUSE holde transformation function
function [q,a]=hra(a)

[n1,n]=size(a);
q1=eye(n);

for k=1:n
    x_1=a(k:n,k);
    if x_1(1,1)==0
        sgn=1;
    else
        sgn=-1;
    end
    q=eye(n)
    [y,z]=size(x_1)
    i=eye(y);
    e1_1=eye(y,1);
    uk=sgn*norm(x_1)*e1_1+x_1;
    u_x=norm(uk)
    if u_x==0
        uk_1=uk
    else
        uk_1=uk/u_x
    end    
    
    a(i:n,i:n)=(i-2*uk_1*uk_1.')*a(i:n,i:n);
    q(i:n,i:n)=i-2*uk_1*uk_1.';
    q1=q*q1;
end 
q=q1';
disp(a,q) % value of Q and R
end    
    
    
    
    
    