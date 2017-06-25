close all;
clear all;

path = 'audio/example01.wav';

%y -> vetor (amostras) 
%Fs -> frequencia das amostras 
[y, Fs] = audioread(path);

signal = y;

%sound(y,Fs);

fc1 = 4*10^4;
fc2 = 8*10^4;
fc3 = 12*10^4;

Fmax = 4*fc3;

dt = 1/(Fmax);
T = length(signal)/Fs;

t= dt:dt:T;

carrier1 = cos(2*pi*fc1*t);
carrier2 = cos(2*pi*fc2*t);
carrier3 = cos(2*pi*fc3*t);

% figure();
% plot(t,carrier1);
% figure();
% plot(t,carrier2);
% figure();
% plot(t,carrier3);

% figure();
% tt= linspace(0,1/Fs,length(y));
% plot(tt,y);

signalReSamp = resample(signal, Fmax, Fs);
signalReSamp = signalReSamp';
c1 = carrier1.*signalReSamp;
c2 = carrier2.*signalReSamp;
c3 = carrier3.*signalReSamp;

g = c1+c2+c3;

G = fftshift(fft(g));

F = Fmax/2;
df = 1/T;
f = -F:df:F-df;

figure();
plot(f,abs(G));

FFTReSamp = fftshift(fft(signalReSamp));

figure();
f = linspace(-fc3, fc3, 220500);
plot(f, abs(FFTReSamp));

FFTCos1 = fftshift(fft(carrier1,T*(2*fc3)));
FFTCos2 = fftshift(fft(carrier2,T*(2*fc3)));
FFTCos3 = fftshift(fft(carrier3,T*(2*fc3)));
FFTCosFinal = fftshift(FFTCos1+FFTCos2+FFTCos3);

figure();
f = linspace(-fc3, fc3, 220500);
plot(f, abs(FFTCosFinal));

convolution = conv(FFTCosFinal, FFTReSamp);
figure();
plot(abs(convolution));

convolution2 = fftshift(conv(FFTCos3,convolution));
figure();
f2 = linspace(-(fc3/661498), (fc3/661498), 661498);
plot(f2,abs((convolution2)));
%normalizar
%multiplicar pelo filtro -> H(f)-pulso - h(t) é o sinc
%aplicar transformada inversa
