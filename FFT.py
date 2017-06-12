import matplotlib.pyplot as matplot
import scipy.fftpack as sfft
import scipy.io.wavfile as wvfile
import pylab as plab

filename = '/Users/fernando/Downloads/alarm_beep.wav' #Path do arquivo de audio
fs, data = wvfile.read(filename) #Funcao que ler o audio de audio e retornar suas informacoes

matplot.plot(data[0:len(data-1)], 'r')

plab.savefig(filename+'_T.png', box_inches='tight') #Salva em uma imagem, representando o sinal no dominio do tempo

first_track = data.T[0:data.size] #Pega soh o primeiro canal

b = [(ele/2**8.)*2-1 for ele in first_track] #Normalizando os elementos deste canal

frequency_representation = abs(sfft.fft(b)) #Faz a FFT

length_frequency = len(frequency_representation)/2 #Pega a metade do tamnanho de frequency_represetantion
matplot.clf()
matplot.plot(frequency_representation[0:length_frequency-1], 'r') #Desenha o grafico da representacao da frequencia indo de 0 ate length(frequency_representation)/2

plab.savefig(filename+'_F.png', box_inches='tight') #Salva em uma imagem, representando a transformado do sinal do dominio do tempo no dominio da frequencia

