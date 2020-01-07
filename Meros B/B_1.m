function [x_new]=B_1(n) 
A = rand(n);

b = rand(n,1);
x_new = rand(n,1);
x_prev = x_new;

w = rand(n,1);
h = rand(n,1);
A = A + w*h';
E = w*h';
while (norm(A*x_new - b,2) > 1e-6 )
	x_prev = x_new;
	x_new = A/(-E*x_prev + b)';

end