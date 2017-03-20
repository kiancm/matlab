figure(1)
Fs = 44100;           % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L1 = 100000;           % Length of signal
t = (0:L1-1)*T;       % Time vector

S1 = .15*sin(2*pi*1046.50*t) + .1*sin(2*pi*1244.51*t) + .2*sin(2*pi*1567.98*t);
%sound(S1,Fs);
audiowrite('cmin.wav',S1,Fs);
Y1 = fft(S1);
P4 = abs(Y1/L1);
P3 = P4(1:L1/2+1);
P3(2:end-1) = 2*P3(2:end-1);
f = Fs2*(0:(L1/2))/L1;
plot(f,P3)
format bank
disp(f(1,find(P3 > .4)))
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

figure(2)
L2 = 100000;            % Length of signal
[S2,Fs2] = audioread('cmin.wav',[1,L2]);
Y2 = fft(S2);
P2 = abs(Y2/L2);
P1 = P2(1:L2/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs2*(0:(L2/2))/L2;
plot(f,P1) 
disp(f(1,find(P1 > .3)))
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')