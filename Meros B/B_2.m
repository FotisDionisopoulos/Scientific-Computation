function [x_new]=B_2(n) 
A = rand(n);

b = rand(n,1);
x_new = rand(n,1);
x_prev = x_new;

w = rand(n,1);
h = rand(n,1);
A = A + w*h';
E = w*h';
t = 0;
if(max(abs(eig(A))) <1 )
	disp('Tha sigklynei');
	conv = 1;
else 
	disp('Den tha sigklynei');
	conv = 0;
end

while (norm(A*x_new - b,2) > 1e-6 )
	x_prev = x_new;
	x_new = A/(-E*x_prev + b)';

	t = t + 1;
	if ((conv == 0) && (t>10))
		break;
	end
	
	end
	
end