for n=[10 50 100]
n=input('enter the dimension')
e=ones(n,1)
A=spdiags([-e 2*e -e], -1:1, n, n);
A=full(A);
b=rand(n,1);
b1=b.'
x0=zeros(n)
y=jacobi(A,b1,0.0001,x0,n)
end


function [k,x]=jacobi(A,b1,epsilon,x0,n)
k=0
x=zeros(n)
while  true
    for i=1:n
        c=0
        for j=1:n
            if j==i
                continue
            else
                c=c+x0(j)*A(i,j)
            end
        end
        x(i)=(b1(i)-c)/A(i,i);
       
    end 
    k=k+1
    if norm(x-x0)<epsilon
        break
    end
    x0=x
end
end
         
