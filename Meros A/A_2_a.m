function [] = A_2_a(n, t);

A = randn(n);
W = randn(n,t);
H = randn(n,t);
rnk  = rank(inv(A+W*H')-inv(A));
if ( rnk == t )
    disp('Einai iso me t');
else 
	 disp('Den einai iso me t');
end
end
