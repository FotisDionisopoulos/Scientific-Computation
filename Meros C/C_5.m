function [ A ] = C_5(T,n)
    
    
        %erwthma 5
        
        [m,~] = size(T);
        I = eye(m);
        D = T + m*I;
        zer = zeros(n);
        A = kron(eye(n),D);
        zer(2:end  , 1)= 1;
        zer(1,2:end)= 1;
        A = kron(zer,T) + A;
        
        
        [L1, U1] = lu(A);
        fprintf('BoreioDytiko: %f\n', (nnz(L1) + nnz(U1)-m*n)/nnz(A));
        
        
        W = eye(m*n);
        W([n*m-m: m*n, 1:m], :) = W([1:m, n*m-m: m*n], :);
        B = W*A*W';
        
        [L2, U2] = lu(B);
        fprintf('NotioAnatoliko: %f\n', (nnz(L2) + nnz(U2)-m*n)/nnz(B));
        figure;spy(B);
        
end

