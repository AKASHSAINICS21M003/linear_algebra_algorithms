function [Q,R] = gramschmit(X)
V1=X(:,1);
Q(:,1)=V1/norm(V1);
[n,k]=size(X);
Q=zeros(n,n);
y=zeros(n,1);
p=1;
j=2;
while j<=k
    V1=X(:,j);
    sum=zeros(n,1);
    i=1;
    while i<=j-1
        q=Q(:,i);
        sum=sum+((V1')*q)*q;
        i=i+1;
    end
    y=V1-sum;
    if norm(y)> 10^(-5)
        p=p+1;
        Q(:,p)=y/norm(y);
    end
    j=j+1;
end
Q=Q(:,1:p);
R=(Q')*X;
end

