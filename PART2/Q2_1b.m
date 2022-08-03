error=zeros(1,15);
B=[3 3 4;3 7 6;4 6 10];
M =sym2tri(B);
triagonal=M;

actual_eig_max= max(eig(B)');

i=1;
while i<=15
    %% QR CALCULATION USING GRAM SCHMIDT
    
    [Q,R] = gramschmit(triagonal);
    
    triagonal=R*Q;
    
    max_eig=max(diag(triagonal));
    %%errror calculation
    error(1,i)=abs(max_eig-actual_eig_max);
    i=i+1;
    
end
%%% ploting of error curve***********
plot([1:15],error);

