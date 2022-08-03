function Y = findsing(B)

B=B*B';
%%thios line is used to  convert the symmetric into tri diagonal matrix

X=sym2tri(B);

Y = trieig(B);
%%% singular value calculation of tridiagonal matrix

Y=sqrt(Y);

end

