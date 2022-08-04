function X=DIVIDE(A)
[m,n]=size(A);
Y=zeros(8);
X=[];
k=1;
i=1;
j=1;
while i<=m
    while j<=n
        k=i+7;
        l=j+7;
        Y=A(i:k,j:l);
        j=j+8;
        X(:,:,k)=Y;
        k=k+1;
    end
    i=i+8;
end  
end
    
    
    
        
        




