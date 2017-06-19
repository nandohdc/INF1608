%FFT Audio.
%Works for small audio files
%Author: Fernando Homem da Costa

%Path - Audio file.
path = 'audio/alarm_beep.wav';

%audioread ->it's a function that will read the wav file.
%y -> vector (amostras) - samples
%Fs -> sampling frequency
[y, Fs] = audioread(path);

%sound(y,Fs);

%numberOfSamples = length of the vector y
numberOfSamples = length(y);

%cosine
x = linspace(0,2*pi*(Fs/2),numberOfSamples);
filter = cos(x);

nfilter = length(filter);

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
time_v = linspace(0, duration, numberOfSamples);

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

frequency2_v = linspace(-maxFq, maxFq, numberOfSamples);

% freqComponents -> the FFT
freqComponents = abs(fft(y, numberOfSamples));

freq2Components = abs(fft(filter, numberOfSamples));

freq3Components = abs(conv(freqComponents, freq2Components));

inversa = abs(ifft(freq3Components, numberOfSamples));

nInversa = length(inversa);

pause(duration);
sound(inversa, Fs);

figure();
subplot(3,3,1);
plot(time_v,y);
grid on; 
title('Time Domain - Signal');
ylabel('Amplitude');
xlabel('Time (s)');
subplot(3,3,3);
plot(frequency_v(1:numberOfSamples), freqComponents(1:numberOfSamples));
grid on; 
title('Frequency Domain - Signal');
ylabel('Amplitude');
xlabel('Frequency (Hz)');
subplot(3,3,2);
plot(x,filter);
grid on; 
title('Time Domain - Filter');
ylabel('Amplitude');
xlabel('Time (s)');
subplot(3,3,4);
plot(frequency2_v(1:numberOfSamples), freq2Components(1:numberOfSamples));
grid on; 
title('Frequency Domain - Filter');
ylabel('Amplitude');
xlabel('Frequency (Hz)');
subplot(3,3,5);
plot(frequency2_v(1:numberOfSamples), freq3Components(1:numberOfSamples));
grid on;
title('Frequency Domain - Result: Filter * Signal ');
ylabel('Amplitude');
xlabel('Frequency (Hz)');
subplot(3,3,6);
plot(time_v, inversa);
grid on;
title('Time Domain - Result: IFFT(Filter * Signal) ');
ylabel('Amplitude');
xlabel('Time (s)');
subplot(3,3,7);
plot(time_v, multFinal);
grid on;
title('Time Domain - Result: Final ');
ylabel('Amplitude');
xlabel('Time (s)');