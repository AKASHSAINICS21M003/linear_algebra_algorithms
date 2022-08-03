function COV=covar(A,B)
SZ=size(A);
k=1;
cov=0;
i=1;
%%%% it is used ton calculate the varriance matrix

while i<=SZ(2)
    C = A(:,i);
    cov=cov+(C-B)*(C-B)';
    i=i+1;
end
COV =cov/SZ(2);
end