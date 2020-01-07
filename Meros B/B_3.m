for n = [ 10 100 1000 ]
    for h = [2 3 4]
	
		A = toeplitz([h ,-1, zeros(1,n-2) ]);
	
		A = rand(n);
		E = rand(n);
		b = rand(n,1);
		x_new = rand(n,1);
		x_prev = x_new;

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


end
 