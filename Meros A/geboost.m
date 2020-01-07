function [x]=geboost(err) 
    A = rand(10);
    b = rand(1,10);
    n = size(A, 1);
    I=eye(n);
    L = I;
    cnt = 0;
    U = A;
    
    for i=1:n-1
        
        if U(i,i) < err
            %poses fores egine boosting
             cnt = cnt +1;
             U=U+I*(err-abs(U(i,i)));
        end
        L(i+1:n,i) = U(i+1:n,i)/U(i,i);
        %L(k+1:n,k) to dianysma auto exei ta stoixeia 
        %poy mhdenizoyn ta stoixeia toy A katw apo ton odhgo
        
        %for j = i+1:n 
        
        % h for einai peritth, prostethhke gia aplousteysh toy kwdika
            %gia kalyterh katanohsh apo emena. 
            %Mporei na antikatastathei me thn entolh j = i+1:n
            
            
         j = i+1:n;
         U(j,i:n) = U(j,i:n)-L(j,i)*U(i,i:n);
            %Edw ginete o mhdenismos twn stoixeiwn katw apo 
            %kathe odhgo. O mhdenismos, ginete me to parapanw
            %dianysma pou kataskeyasthke.
            
            
        %end
    end
    fprintf('Egine tonosh %d fores\n',cnt);
    disp('Epilysh toy Ax=b me thn bohtheia ths LU...');
    y = L/b;
    x = U/y;
    
end