a=[3 1 1 ;1 7 3;2 0 4];%first system of equations 
b=[5 11 5];
x0=[0 0 0];%end
a1=[9 3 3;1 5 1;2 1 4];%second system of equations 
b1=[7 15 7];% end
p=zeros(3,3)
D=zeros(3,3)%diagonal matrix
L=zeros(3,3)
U=zeros(3,3)
for i=1:3
    for j=1:3
        if i>j
            L(i,j)=a(i,j);%l d u calculation
        elseif i<j
            U(i,j)=a(i,j);
        else
            D(i,j)=a(i,j);
        end
    end
end
p=L+D+U;
disp(p);
            
y=jacobi(a,b,0.0001,x0);
disp(y);%iteration count
z=gauss_siedel(a,b,0.0001,x0);      % both system are converges in particular tolerance value for both the methods 
disp(z);%iteration count
w=jacobi(a1,b1,0.0001,x0)
disp(w);%iteration count
t=gauss_siedel(a1,b1,0.0001,x0)
disp(t);%iteration count

function [k]=jacobi(a,b,epsilon,x0)
k=0;
x=zeros(1,3);
while  true
    for i=1:3
        c=0;
        for j=1:3
            if j==i
                continue
            else
                c=c+x0(j)*a(i,j);
            end
        end
        x(i)=(b(i)-c)/a(i,i);
    end
    k=k+1;
    if (norm(x-x0)/norm(x0))<epsilon
        break
    end
    x0=x;
end
disp(x);
end
function[k]=gauss_siedel(a,b,epsilon,x0)
k=0;
x1=zeros(1,3);
while true
    for i=1:3
        c=0;
        j=1;        
        while j<=i-1
                c=c+a(i,j)*x1(j);
                j=j+1;
        end
        
        for j=i+1:3
                c=c+a(i,j)*x0(j);
        end
        
        x1(i)=(b(i)-c)/a(i,i);
    end
    k=k+1;
    if norm(x1-x0)/norm(x0)<epsilon
        break 
    end
    x0=x1;
end
disp(x1);
end
    
    
        



        
    





