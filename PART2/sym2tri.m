
function tri_dig=sym2tri(tri_dig)
%INPUT MATRIX MUST BE SYMMETRIC MATRIX OTHER WISE ERROR 
dim=size(tri_dig);
i=1;
% conversion of a symmetric matrix into tridiagonal matrix by
%%given rotation method
while i<=dim-1
    j=i+2;
    while j<=dim
        mat_1=eye(dim);
        x=tri_dig(i+1,i);
        y=tri_dig(j,i);
        %ANGLE CALCULATION FOR QR DECOMPOSITION USING GIVEN ROTATION
        angle=atan(y/x);
        %SINE ANGLE CALCULATION
        sine=sin(angle);
        %cosine angle calculation
        cosine=cos(angle);
        %%elementary mnatrix calculations Q 
        mat_1(j,i+1)=-1*sine;
        mat_1(i+1,j)=sine;
        mat_1(i+1,i+1)=cosine;
        mat_1(j,j)=cosine;
        tri_dig=mat_1*tri_dig;
        tri_dig=tri_dig*mat_1'; 
        j=j+1;
    end
    i=i+1;
end
%display of tri diagonal matrix
disp(tri_dig);
end