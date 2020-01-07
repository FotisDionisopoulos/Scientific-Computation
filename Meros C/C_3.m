function [ L1 U1 ] = C_3(T,n)
        
        %erwthma 3
        [m,~] = size(T);
        I = eye(m);
        D = T + m*I;
        zer = zeros(n);
        A = kron(eye(n),D);
        zer(2:end  , 1)= 1;
        zer(1,2:end)= 1;
        A = kron(zer,T) + A;
        
        [L1, U1] = lu(A);
        figure;spy(L1);figure;spy(U1);
        
        
end
        