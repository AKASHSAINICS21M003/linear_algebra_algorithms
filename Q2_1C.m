n=input('enter the dimension value of square matrix');
tol=input('tolerance value');
A = 0.00001*eye(n)+hilb(n);
grams(A,tol,n);
hra(A);

function [error1]=grams(A,tol,n)
q=zeros(n,n);
r=zeros(n,n);
b=zeros(n,n);
R=zeros(n,n);
q(:,1)=A(:,1)/norm(A(:,1))
k=2;
%Q CALCULATION
for i=2:n
    sum=zeros(n,1);
    for j=1:i-1
        c=dot(q(:,j),A(:,i));
        sum(:,1)=sum(:,1)+c*q(:,j);
    end
    r(:,i)=A(:,i)-sum(:,1);
    if norm(q(:,i))>tol
       q(:,i)=r(:,i)/norm(r(:,i));
       k=k+1
    end   
end
%R CALCULATION
for i=1:n
    for j=1:n
        if i<=j
            R(i,j)=dot(q(:,i),A(:,j));
        else
            R(i,j)=0;
        end
    end
end
disp(q);
disp(R);
error=0;
q_1=zeros(n,n)
q_1=q'*q
[m1,m2]=size(q_1);
i=eye(m1);
%error calculation between q'q and  ientity matrix
for i=1:m1
    for j=1:m1
        c=q_1(i,j)-i(i,j)
        error=error+c*c
    end
end
error=sqrt(error)
disp(error);%error between q'q and identity mtarix
%error estimation between A and Q * R matrix
c=q*R;
error1=0;
for i=1:n
    for j=1:n
        error1=error1+(A(i,j)-c(i,j))*(A(i,j)-c(i,j));
    end
end
error1=sqrt(error1);
disp(error1);%error between A and QR matrix 
end
function [error1]=hra(a)%HOUSEHOLD REFLECTION
A=a;
[m,n]=size(a);
q1=eye(n);
k=1
while k<=n
    x_1=a(k:n,k);
    if x_1(1,1)==0
        sgn=1;
    else
        sgn=-1;
    end
    q=eye(n)
    [y,z]=size(x_1);
    i=eye(y);
    e1=eye(y,1);
    uk=sgn*norm(x_1)*e1+x_1;
    u_x=norm(uk)
    if u_x==0
        uk_1=uk;
    else
        uk_1=uk/u_x;
    end    
    
    a(i:n,i:n)=(i-2*uk_1*uk_1.')*a(i:n,i:n);
    q(i:n,i:n)=i-2*uk_1*uk_1.';
    q1=q*q1;
k=k+1    
end 
q=q1';
r=a;
error=0;
i=eye(n);
%error calculation between q and  ientity matrix
for i=1:n
    for j=1:n
         error=error+(q(i,j)-i(i,j))*(q(i,j)-i(i,j))
    end
end
error=sqrt(error)
disp(error)%error between q and identity mtarix
%error estimation of  A and  QR matrix
c=q*R;
error1=0;
for i=1:n
    for j=1:n
        error1=error1+(A(i,j)-c(i,j))*(A(i,j)-c(i,j));
    end
end
error1=sqrt(error1);
disp(error1);%error between A and QR matrix 


end  

