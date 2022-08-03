%%input matrix is positive semidefinite matrix
function [L]=cholprog(A);
[m,n]=size(A)
L=zeros(n,n);
i=1;
while i<=n
    sum=0;
    k=1;
    while k<=i-1
        sum=sum+L(i,k)^2;
        k=k+1;
    end
    L(i,i)=(A(i,i)-sum)^0.5;
    for j=i+1:n
        sum_1=0;
        for k=1:i-1
            sum_1=sum_1+L(i,k)*L(j,k);
        end  
        L(j,i)=(A(i,j)-sum_1)/L(i,i);
    end
    i=i+1;
end    
disp(L);
end
