function[A,B]=corrNRV(mean_v,cov_v,size,iteration)%output two matrices of uncorrelated and correlated random vectors 
%cholesky decomposition of covarriance matrix


L=cholprog(cov_v);
%initialize
B=[];
%generate of 1000 uncorrelated vectors
A=randn(size,iteration);
i=1;
%%% calculatr values of 1000 random uncorrealated vectors;;;;;

while i<=iteration
    a=L*A(:,i)
    B(:,i)=a+mean_v;
    i=i+1;
end
end