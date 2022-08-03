function Z=VECTORIZATION(X)
s=size(X);
Z=zeros(64,12288);
i=1;
%% vectorization of particular channel matrix

while i<=s(3)
    A=X(:,:,i);
    Z(:,i)=reshape(A,[s(1)*s(2),1]);
    i=i+1;
end
end
