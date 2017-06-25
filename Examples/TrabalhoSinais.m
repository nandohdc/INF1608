%FFT Audio.
%Works for small audio files
%Author: Fernando Homem da Costa
clc;
close all;
clear all;

%Path - Audio file.
path = 'audio/alarm_beep.wav';

%audioread ->it's a function that will read the wav file.
%y -> vector (amostras) - samples
%Fs -> sampling frequency
[signal, Fs] = audioread(path);

%sound(y,Fs);

%numberOfSamples = length of the vector y
numberOfSamples = length(signal);

%It will display on console the numberOfSamples
disp("Number Of Samples: " + numberOfSamples);

%It will display on console the frequency sampling
disp("Sampling frequency: " + Fs);

%deltaT = 1/fs - seconds/sample
deltaT = 1/Fs;

%It will display on console deltaT
disp("Delta T: " + deltaT);

%numberOfSampes * 1/Fs = duration (audio file)
duration = (numberOfSamples * deltaT);

%It will display on console the frequency sampling
disp("Audio -  duration: " + duration);

%time vector -> 0 - duration, numberOfSamples evenly spaced points
time_v = 0:duration:numberOfSamples;

%deltaF -> 2MaxFreq/N = Fs/N = 1/T (T = duration)
deltaF = Fs/numberOfSamples;

%It will display on console the deltaF
disp("Delta F: " + deltaF);

%Max Frequency -> 2/deltaT = Fs/2
maxFq = (deltaF*numberOfSamples)/2;

%It will display on console the Max Frequency
disp("Max Frequency: " + maxFq);

%It will display on console the comparison between 1/deltaF(T) and
%duration(UP/\)
disp("1/deltaF (T): " + 1/deltaF + " X "+"Audio - duration:  " + duration);

%frequency vector -> 0 - duration, numberOfSamples evenly spaced points
frequency_v = linspace(-maxFq, maxFq, numberOfSamples);


% freqComponents -> the FFT
%freqComponents = fftshift(fft(signal, numberOfSamples));

%result = modulate(signal,10^3,Fs, 'am');

%plot(result);
fc = 10^4;
tt = 0:duration:duration*fc;
carrier = cos(2*pi*fc*tt);
result2 = carrier.*signal;
figure();
subplot(2,1,1);
plot(result2);
