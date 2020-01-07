
        iter = [ 4 250;8 125;8 250; 16 125]
        %erwthma 6
        for i = 1:4
            m = iter(i,1);
            n = iter(i,2);
        rng(5214)
        T=full(sprand(m,m,0.6));
        fprintf('***********\nm = %d\n', m);
        fprintf('***********\nn = %d\n', n);
        I = eye(m);
        D = T + m*I;
        zer = zeros(n);
        A = kron(eye(n),D);
        zer(2:end  , 1)= 1;
        zer(1,2:end)= 1;
        A = kron(zer,T) + A;
        
       
        W = eye(m*n);
        W([n*m-m: m*n, 1:m], :) = W([1:m, n*m-m: m*n], :);
        B = W*A*W';
        
        
        e = ones(m*n,1);
        b = A*e;
        
        x =  A\b;
        f1 = @() A\b;
        time1(i) = timeit(f1)
        fprintf('Xronos gia to x: %f\n',time1(i));
        
        e =   B*W\W*b;
        f2 = @()  B*W\W*b;
        time2(i) = timeit(f2)
        fprintf('Xronos gia to e: %f\n',time2(i));
        
        fprintf('error value: %s\n', norm(e - x,inf)/norm(e,inf));
        
        
    end
 fprintf('Mesos xronos gia to x: %f\n', mean(time1));
 fprintf('Mesos xronos gia to e: %f\n', mean(time2));
 

