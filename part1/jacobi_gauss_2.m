r=[2 -1 0 0 0 0 0 0 0 0];%first matrix
t=toeplitz(r);
b=[11 0 0 0 0 0 0 0 0 0];%first b
x0=zeros(1,10);
k=jacobi1(t,b,0.0001,x0);
disp(k);%iteration count
k1=gausssiedel(t,b,0.0001,x0);
disp(k1);%iteration count
r1=[2 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];%second matrix
t1=toeplitz(r1);
b1=[21 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];%second b
%k2=jacobi2(t1,b1,0.0001,x0);
%disp(k2);%iteration count
%k3=gausssiedel2(t1,b1,0.0001,x0);
%disp(k3);% iteration
function [k]=jacobi1(t1,b1,epsilon,x0)
x=zeros(1,10)
k=0;
while true
    for i=1:10
        c=0;
        for j=1:10
            if j==i
                continue
            else
                c=c+t1(i,j)*x0(j);
            end
        end
         x(i)=(b1(i)-c)/t1(i,i);
    end
    k=k+1
    if norm(x-x0)/norm(x0)<epsilon
        break
    end
    x0=x;
end    
disp(x);    %estimated x    
end  
function[k]=gausssiedel(t,b,epsilon,x0)
k=0;
x1=zeros(1,10);
while true
    for i=1:10
        c=0;
        j=1;
        while j<=i-1
            c=c+t(i,j)*x1(j);
            j=j+1;
        end
        for j=i+1:10
            c=c+t(i,j)*x0(j);
        end
        x1(i)=(b(i)-c)/t(i,i);
     end
    k=k+1;
    if norm(x1-x0)/norm(x0)<epsilon
        break
    end    
    x0=x1;
end 
disp(x1);% estimated x1
end

           
     
    