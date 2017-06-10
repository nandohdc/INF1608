%FFT Audio.
%Author: Fernando Homem da Costa

%filename -> audio file
filename = '/Users/fernando/Downloads/DIWK.wav';

%audioread ->it's a function that will read the wav file.
%y -> samples (amostras)
%fs -> sampling frequency (amostras de frequência)
%sample_v -> sampling time vector [start:finish]
sample_v = [1,60];
[y, fs] = audioread(filename, sample_v);

%linspace -> it's function that will create the time vector
%starting time = 0;
%ending time = length(y)/fs
%length(y) = the number of samples in y
time_v = linspace(0,length(y)/fs, length(y));

%plot -> it's function that will create the graphic of y(t) x t
plot(time_v,y);


%lengthFFT -> it's the length of the FFT.
lengthFFT = 1024;

%frequency_v -> it's the frequency vector
%first frequency = 0
%ending frequency = fs
%lengthFFT = length of the frequency vector
frequency_v = linspace(0, fs, lengthFFT);

% x -> the FFT of the samples y in 1024 points
x = abs(fft(y,lengthFFT));

figure; plot(frequency_v(1:lengthFFT/2), x(1:lengthFFT/2));
%plot(psd(spectrum.periodogram,y,'Fs',fs,'NFFT',length(y)));

