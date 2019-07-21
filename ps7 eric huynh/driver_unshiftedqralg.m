function [eigenVals, convergHistory] = driver_unshiftedqralg(A)
%Unshifted QR
A = hilb(4); 
%A = diag(15:-1:1) + ones(15,15);
 
Tnew = tridiag(A); 
m = size(Tnew,1);
convergHistory = [];
eigenVals = zeros(size(Tnew,1),1);

for i = 1:m
    [Tnew, currHist] = qralg(Tnew(1:(m - i + 1), 1:(m - i + 1)));
    eigenVals(i) = Tnew(m - i + 1, m - i + 1);
    for j = 1:size(currHist,2)
       convergHistory(end+1) = currHist(j);        
    end 
end 

clf
semilogy(convergHistory,'o-')
grid on
xlabel('QR iterations');
ylabel('|t_{m,m-1}|');
eigenVals
end