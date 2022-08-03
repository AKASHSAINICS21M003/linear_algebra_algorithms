



for n=[10 50 100]
    for m=[0.1 0.01 0.001 0.0001 0.00001]
        e=ones(n,1);
        A=spdiags([-e 2*e -e], -1:1, n, n);
        A=full(A);
        b1=rand(n,1);
%         b1=b';
        x0=zeros(1,n);
        y=jacobim(A,b1,m,x0,n);
       
    end
end   
fprintf("system sizeis increasing algorithm taking more time")
fprint("as the tolerance is decreases more no of iteration it take "  )

function x=jacobim(A,b1,epsilon,x0,n)
k=0;
x=zeros(1,n);
    while true
        for i=1:n
            c=0;
            for j=1:n
                if j==i
                    continue
                else
                    c=c+x0(j)*A(i,j);
                end
            end
            x(i)=(b1(i)-c)/A(i,i);

        end 
        k=k+1;
        if norm(x-x0)/norm(x0)<epsilon
            break
        end    
        x0=x;
    end
disp(k);%iteration count
end
         