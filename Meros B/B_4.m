clear; clc;
for n = [ 10 100 1000 ]
    for h = [2 3 4]
        A = toeplitz([h ,-1, zeros(1,n-2) ]);
        b=rand(n,1);
        w = rand(n,1);
        w = w/norm(w);
        h = w(n:-1:1);
        A = A + w*h';

        [L,U,P]=lu(A);

        U=single(U);
        L=single(L);
        P=single(P);


        x_prev=single(U\(L\(P*single(b))));
        k=1;
        
        t = 0;
		if(max(abs(eig(A))) <1 )
			disp('Tha sigklynei');
			conv = 1;
		else 
			disp('Den tha sigklynei');
			conv = 0;
        end
        

        while(k==1|| err > 1e-6)
            r=b-A*x_prev;
            z=single(U\(L\(P*single(r))));
            x=x_prev+z;
            k=k+1;
            err = norm(A*x - b,2);
            
            x_prev = x;
            
            
            t = t + 1;
			if ((conv == 0) && (t>10))
				break;
			end
	
        end
        end
end
        
