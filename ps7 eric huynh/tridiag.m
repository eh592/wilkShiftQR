function T = tridiag(A)
%HOUSE Householder triangularization.
%   [W,R]=HOUSE(A) computes the QR factorization of A using
%   the Householder algorithm. Use FORMQ to construct Q.

% UC Berkeley Math 221, Per-Olof Persson <persson@berkeley.edu>

[m,n] = size(A);
W = zeros(m,n);
for k = 1:(m-2)
    v = A((k+1):m,k);
    v(1) = v(1) + (2 * (v(1) >= 0) - 1) * norm(v);
    v = v / norm(v);
   % W((k+1):m,k) = v;
    A((k+1):m,k:m) = A((k+1):m,k:m) - 2 * v * (v' * A((k+1):m,k:m));
    A(1:m,(k+1):m) = A(1:m,(k+1):m) - 2 * (A(1:m,(k+1):m)*v)*v';
end
T = A;

end

