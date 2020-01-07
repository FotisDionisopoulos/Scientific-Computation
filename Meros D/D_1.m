clear; clc;
%erwthma 1
n = 200:200:1400;

time1 = zeros(1,7);
time2 = zeros(1,7);

for i = 1:length(n)
    A = rand( n(i) );
    
    % X = qr(A)
    tic
    X = qr(A);
    time1(i) = toc;

    % [Q,R] = qr(A)
    tic
    [Q,R] = qr(A);
    time2(i) = toc;
end

[T_x_n, S1, mu1]= polyfit(n, time1, 3);
%T_x_n = polyfit(n, time1, 3);
fprintf('X = qr(A): %e n^3 + %e n^2 + %e n +%e \n',T_x_n(1),T_x_n(2),T_x_n(3),T_x_n(4) );

[T_QR_n, S2, mu2]= polyfit(n, time2, 3);
%T_QR_n= polyfit(n, time2, 3);
fprintf('Q R = qr(A): %e n^3 + %e n^2 + %e n +%e \n',T_QR_n(1),T_QR_n(2),T_QR_n(3),T_QR_n(4) );


