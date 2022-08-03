%%QUESTION ----1
I=im2double(imread('E:/watch.bmp'));
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
stepsize=8;

%%QUESTION -----2

X=DIVIDE(R);%%breaking of red channel matrix
Z=DIVIDE(B);%%breaking of blue channel matrix
Y=DIVIDE(G);%%breaking of green channel matrix
Xx=VECTORIZATION(X);%% CONVERSION OF 8*8 MATRIX INTO 64 *1 VECTOR
Yy=VECTORIZATION(Y);
Zz=VECTORIZATION(Z);
s=size(Y);
%sample mean calculation

%%%QUESTION-----3

Sr=sum(Xx,2)/s(3);
disp(Sr);%%mean of every R64 vector with every colour channel
Sg=sum(Yy,2)/s(3);%SAMPLE  MEAN OF GREEN CHANNEL
disp(Sg);
Sb=sum(Zz,2)/s(3);%SAMPLE MEAN OF BLUE CHANNEL
disp(Sb);
%%QUESTION ----4

Cr=covar(Xx,Sr);%covarriance matrix calculation of red channel
disp(Cr);
Cg=covar(Yy,Sg);%""""""""""""""""""""""""""""""""" green channel
disp(Cg);
Cb=covar(Zz,Sb);%""""""""""""""""""""""""""""""""" blue channel
disp(Cg);

%calculation of eigen vectors and eigen values of every channel covarriance
%matrix
%%%QUESTION ----5
%% eigen vectors and eigen values calculation of RED channel 


[VR,eignr] = eig(Cr);
eignr = diag(eignr);
[eignr,index_r] = sort(eignr,'descend');
VR = VR(:,index_r);


%% eigen vectors and eigen values calculation of BLUE channel 


[VB,eign_b] = eig(Cb);
eign_b = diag(eign_b);
[eignb,index_b] = sort(eign_b,'descend');
VB = VB(:,index_b);
%% eigen vectors and eigen values calculation of RED channel 


[VG,eign_g] = eig(Cg);
eign_g = diag(eign_g);
[lambdag,index_g] = sort(eign_g,'descend');
VG = VG(:,index_g);



