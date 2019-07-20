function [Tnew, errHistory] = qralg(T)
it = 1;
errHistory = [];
if (size(T,1) == 1)
    Tnew = T;
    return;
else
    while(abs(T(size(T,1),size(T,1)-1)) > 10^-12)
        [W,R] = house(T);
        Q = formQ(W);
        T = R*Q; 
        errHistory(it) = abs(T(size(T,1),size(T,1) - 1));
        it = it + 1;
    end
end
Tnew = T;
end

