%FFT Audio.
%Works for small audio files, doesn't work for music
%Author: Fernando Homem da Costa

%filename -> audio file
filename = 'audio/alarm_beep.wav';

%audioread ->it's a function that will read the wav file.
%y -> samples (amostras)
%fs -> sampling frequency (amostra de frequência)
[y, fs] = audioread(filename);

sound(y, fs);

%linspace -> it's function that will create the time vector
%starting time = 0;
%ending time = length(y)/fs
%length(y) = the number of samples in y
time_v = linspace(0,length(y)/fs, length(y));

%plot -> it's function that will create the graphic of y(t) x t
plot(time_v,y);
grid on; 
title('Time Domain');
ylabel('Amplitude');
xlabel('Time (s)');

%N -> number of samples
N = length(y);

%deltaF -> distance between two samples of frequency.
deltaF = fs/N;

disp("Número de amostras: " + N);
disp("Intervalo entre duas amostras de frequências: " + deltaF);
disp("Taxa de frequência: " + fs);

%frequency_v -> it's the frequency vector
%first frequency = 0
%ending frequency = fs
%lengthFFT = length of the frequency vector
frequency_v = linspace(0, deltaF, N/2);

% x -> the FFT of the samples y in 1024 points
x = abs(fft(y ,N));

figure;
plot(frequency_v(1:N/2), x(1:N/2));
grid on; 
title('Frequency Domain');
ylabel('Amplitude');
xlabel('Frequency (Hz)');
%plot(psd(spectrum.periodogram,y,'Fs',fs,'NFFT',length(y)));

