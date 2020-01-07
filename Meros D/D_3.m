clear; clc;
%erwthma 1
n = 200:200:1400;
n2 = 250:200:1750;

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

%[T_x_n, S1, mu1]= polyfit(n, time1, 3);
T_x_n = polyfit(n, time1, 3);

%[T_QR_n, S2, mu2]= polyfit(n, time2, 3);
T_QR_n= polyfit(n, time2, 3);



%erwthma 3
disp('part3')
time1_3 = zeros(1,8);
time2_3 = zeros(1,8);

newT_x_n  = polyval(T_x_n , n);
newT_QR_n = polyval(T_QR_n, n);

for k = 1:length(n2)
    B = rand(n2(k));

    % X = qr(A) 
    tic
    X = qr(B);
    time1_3(k) = toc;

    %[Q,R] = qr(A)
    tic
    [Q,R] = qr(B);
    time2_3(k) = toc;
end

figure;
plot(n, newT_x_n,'--', n2, time1_3,'r+')
figure;
plot(n, newT_QR_n,'--', n2, time2_3,'r+')



