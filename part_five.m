%%% PART 5 %%%

figure;
subplot(5,1,1);
t = linspace(-4, 4, 1000);
y = square(2*pi*(t+1)/4);
plot(t, y, 'b');
ylim([-1.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('X(t)');
grid on;

ak = @(k) 0.25 * (trapezoidal_rule(@(t) -exp(-0.5*1i*pi*k*t), -2, -1, 1000) ...
    +trapezoidal_rule(@(t) exp(-0.5*1i*pi*k*t), -1, 1, 1000) + ...
    trapezoidal_rule(@(t) -exp(-0.5*1i*pi*k*t), 1, 2, 1000));

subplot(5,1,2);
fplot(@(k)sinc(k/2));
xlabel('k');
ylabel('ak');
title('Fourier Series Coefficents');
grid on;

syms X(t,k);
size_of_k = 20;
K1 = -1*size_of_k:size_of_k; 
K = nonzeros(K1);
K = K';
x = 0;
X(k) = sinc(k/2).* exp(0.5*1i*pi*k*t);
for k = K
    x = x + X(k);
end

subplot(5,1,3);
fplot(x, [-4,4]);
xlabel('t');
ylabel('x');
title('Fourier Series When -20 < k < 20');
grid on;

syms X1(t,k);
size_of_k_new = 100;
K2 = -1*size_of_k_new:size_of_k_new; 
K = nonzeros(K2);
K = K';
x = 0;
X1(k) = sinc(k/2).* exp(0.5*1i*pi*k*t);
for k = K
    x = x + X1(k);
end

subplot(5,1,4);
fplot(x, [-4,4]);
xlabel('t');
ylabel('x');
title('Fourier Series When -100 < k < 100');
grid on;

syms X2(t,k);
size_of_k_newer = 500;
K3 = -1*size_of_k_newer:size_of_k_newer; 
K = nonzeros(K3);
K = K';
x = 0;
a(k) = sinc(k/2);
X2(k) = sinc(k/2).* exp(0.5*1i*pi*k*t);
for k = K
    x = x + X2(k);
end

subplot(5,1,5);
fplot(x, [-4,4]);
xlabel('t');
ylabel('x');
title('Fourier Series When -500 < k < 500');
grid on;

figure;
subplot(3,1,1);
t = linspace(-4, 4, 1000);
y_new = square(2*pi*t/4);
plot(t, y_new, 'b');
ylim([-1.5 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('NEW X(t)');
grid on;

ck = @(k) 0.25 * (trapezoidal_rule(@(t) -exp(-0.5*1i*pi*k*t), -2, 0, 1000) ...
    +trapezoidal_rule(@(t) exp(-0.5*1i*pi*k*t), 0, 2, 1000));

subplot(3,1,2);
fplot(@(k)-sinc(k/2).*sin(k*pi/2));
xlabel('k');
ylabel('ck');
c(k) = -1i*sinc(k/2).*sin(k*pi/2);
title('Imaginary Part of Fourier Series Coefficents');
grid on;

syms X_NEW(t,k);
size_of_k_newer = 500;
K_NEW = -1*size_of_k_newer:size_of_k_newer; 
K = nonzeros(K_NEW);
K = K';
x = 0;
X_NEW(k) = -1i* sinc(k/2).* sin(k*pi/2).*exp(0.5*1i*pi*k*t);
for k = K
    x = x + X_NEW(k);
end

subplot(3,1,3);
fplot(x, [-4,4]);
xlabel('t');
ylabel('x');
title('Fourier Series When -500 < k < 500');
grid on;

a_3 = ak(3);
c_3 = ck(3);
coefficients_relation = c_3 / a_3;
disp('ck / ak for k = 3: ');
disp(coefficients_relation);