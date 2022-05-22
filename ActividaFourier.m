Fs = 1000;                      % Frecuencia de Muestreo
T = 1/Fs;                       % Periodo de Muestro
L = 1000;                       % Largo de la Señal
t = (0:L-1)*T;                  % Vector Tiempo

x1 = cos(2*pi*200*t);           % Señal 1
x2 = 10*cos(2*pi*500*t);        % Señal 2
x3 = (x1+x2)/2;                 % Suma de Señal 1 y 2
x4 = (x3 + randn(size(t)))/2;   % Señal anterior con ruido
x5 = audioread('acoustic.wav'); % Señal acoustic.wav

%SEÑAL DE 200 HZ
figure;
sgtitle('Señal sinusoidal de amplitud unitaria y frecuencia 200 Hz.')
subplot(3,1,1)
plot(t(1:100),x1(1:100))
title('Grafica de señal')

n = 2^nextpow2(L);
dim = 2;
    
subplot(3,1,2)
spectrogram(x1,128,120,128,1e3,'yaxis');
title('Espectrograma de la señal')
    
Y = fft(x1,n,dim);
P2 = abs(Y/L);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);

subplot(3,1,3)
plot(0:(Fs/n):(Fs/2-Fs/n),P1(1:n/2))
title('Transformada de Fourier de la señal')

%Señal sinusoidal de amplitud 10 y frecuencia 500 Hz, 1 segundo de duración
figure;
sgtitle('Señal sinusoidal de amplitud 10 y frecuencia 500 Hz.')

subplot(3,1,1)
plot(t(1:100),x2(1:100))
title('Grafica de señal')
    
n = 2^nextpow2(L);
dim = 2;
    
subplot(3,1,2)
spectrogram(x2,128,120,128,1e3,'yaxis');
title('Espectrograma de la señal')
    
Y = fft(x2,n,dim);
P2 = abs(Y/L);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);

subplot(3,1,3)
plot(0:(Fs/n):(Fs/2-Fs/n),P1(1:n/2))
title('Transformada de Fourier de la señal')

%SEÑAL DE LA SUMA
figure;
sgtitle('Suma de las señales previas.')

subplot(3,1,1)
plot(t(1:100),x3(1:100))
title('Grafica de señal')

n = 2^nextpow2(L);
dim = 2;
    
subplot(3,1,2)
spectrogram(x3,128,120,128,1e3,'yaxis');
title('Espectrograma de la señal')
    
Y = fft(x3,n,dim);
P2 = abs(Y/L);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);

subplot(3,1,3)
plot(0:(Fs/n):(Fs/2-Fs/n),P1(1:n/2))
title('Transformada de Fourier de la señal')

%Suma de las señales previas con ruido blanco
figure;
sgtitle('Suma de las señales previas con ruido blanco.')

subplot(3,1,1)
plot(t(1:100),x4(1:100))
title('Grafica de señal')
    
n = 2^nextpow2(L);
dim = 2;
    
subplot(3,1,2)
spectrogram(x4,128,120,128,1e3,'yaxis');
title('Espectrograma de la señal')
    
Y = fft(x4,n,dim);
P2 = abs(Y/L);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);

subplot(3,1,3)
plot(0:(Fs/n):(Fs/2-Fs/n),P1(1:n/2))
title('Transformada de Fourier de la señal')

%Señal Acoustic.wav
f = figure;
sgtitle('Señal de acoustic.wav')

subplot(3,1,1)
plot(t(1:100),x5(1:100))
title('Grafica de señal')
 
n = 2^nextpow2(L);
dim = 2;

subplot(3,1,2)
spectrogram(x5,128,120,128,1e3,'yaxis')
title('Espectrograma de la señal')
    
Y = fft(x5,n,dim);
P2 = abs(Y/L);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);

subplot(3,1,3)
plot(0:(Fs/n):(Fs/2-Fs/n),P1(1:n/2))
title('Transformada de Fourier de la señal')
