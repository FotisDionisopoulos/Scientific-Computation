n = 10

A = randn(n);
[t L U] = A_4_luboost(A, 1e-6);
rnk  = rank(L*U - A);
if ( rnk == t )
    disp('To rank Einai iso me t');
else 
	 disp('To rank Den einai iso me t');
end

