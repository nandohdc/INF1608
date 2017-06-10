%How to play an audio file on MATLAB.
%Author: Fernando Homem da Costa

%audioread ->it's a function that will read the wav file.
%filename -> audio file
%y -> samples (amostras)
%fs -> sampling frequency (amostras de frequência)

filename = '/Users/fernando/Downloads/DIWK.wav';

[y, fs] = audioread(filename);

sound(y, fs);

