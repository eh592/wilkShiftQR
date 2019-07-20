function [Tnew, errHistory] = wilk_qralg(T)
it = 1;
errHistory = [];
n = size(T,1);
if (size(T,1) == 1)
    Tnew = T;
    return;
else
    while(abs(T(size(T,1),size(T,1)-1)) > 10^-12)       
        B = T(n-1:n,n-1:n);
        delta = (B(1,1)-B(2,2))/2;   
        if delta == 0 
            Sign = -1;
            shift = B(2,2) - (Sign*B(2,1)^2) / (abs(delta) + sqrt((delta^2) + B(2,1)^2));
        else
            Sign = sign(delta);
            shift = B(2,2) - (Sign*B(2,1)^2) / (abs(delta) + sqrt((delta^2) + B(2,1)^2));
        end      
        [W,R] = house((T-shift*eye(n)));
        Q = formQ(W);
        T = R*Q + shift*eye(n);       
        errHistory(it) = abs(T(size(T,1),size(T,1) - 1));
        it = it + 1;
    end
end
Tnew = T;
end