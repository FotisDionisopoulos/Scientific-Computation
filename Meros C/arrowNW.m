function [ A ] = arrowNW(T,n)

        %erwthma 1 kai 2
        [m,~] = size(T);
        I = eye(m);
        D = T + m*I;
        zer = zeros(n);
        A = kron(eye(n),D);
        zer(2:end  , 1)= 1;
        zer(1,2:end)= 1;
        A = kron(zer,T) + A;
        
        figure;spy(A);
        
end


