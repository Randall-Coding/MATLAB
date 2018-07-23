close all

X = linspace(-10*pi,10*pi,1000);
S = sin(X) + sin(10*X) + sin(100*X);

subplot(2,1,1);
plot(X,S);  %plot sin function

Fx = real (fft (S) );

subplot(2,1,2);
plot(Fx);   %plot transform


figure; 

syms t; 
f = sin(t) + sin(10*t) + sin (100*t); 

subplot(2,1,1);
fplot(f);

ft_f = real ( fourier(f) ); 
subplot(2,1,2);
fplot(ft_f);