
n=input('enter the dimension of square matrix')
tolerance=input('enter the tolerance value ')
a=zeros(n,n)
for i=1:n
    for j=1:n
        a(i,j)=input('entre the values' )
    end
end
grams(a,tolerance,n);
function [q,r]=grams(a,tolerance,n)
q=zeros(n,n);
r=zeros(n,n);
b=zeros(n,n);
R=zeros(n,n);
q(:,1)=a(:,1)/norm(a(:,1));
k=2
%Q CALCULATION
for i=2:2
    sum=zeros(n,1);
    for j=1:i-1
        c=dot(q(:,j),a(:,i));
        sum(:,1)=sum(:,1)+c*q(:,j)
    end
    r(:,i)=a(:,i)-sum(:,1);
    if norm(q(:,i))>tolerance
        q(:,i)=r(:,i)/norm(r(:,i));
        k=k+1;
    end    
end
%R CALCULATION
for i=1:n
    for j=1:n
        if i<=j
            R(i,j)=dot(q(:,i),a(:,j));
        else
            R(i,j)=0;
        end
    end
end  
disp(q);%Q MATRIX
disp(R);%R MATRIX
end
            

        
    
    

    
    
