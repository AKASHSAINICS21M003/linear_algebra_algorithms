function x = trieig(A)
M =sym2tri(A);
triagonal=M;

[n,c]=size(A);
x=zeros(n,1);
i=1;
while i<15
    [Q,R] = gramschmit(triagonal);%% approximate n^2 count are recognized
    triagonal=R*Q;
    i=i+1;
end
% for i=1:n
%     x(i,1)=triagonal(i,i);
% end
x=diag(triagonal);
end

