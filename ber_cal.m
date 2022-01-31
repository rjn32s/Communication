%Calculating the Bit Error Rate
%Instructions are in the task pane to the left. Complete and submit each task one at a time.
%This code simulates a 16-QAM link with AWGN.
% Simulation parameters 
numBits = 20000;
modOrder = 16;
% Create source signal and apply 16-QAM modulation
srcBits = randi([0,1],numBits,1);
modOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);

% Apply AWGN
SNR = 15;  % dB
chanOut = awgn(modOut,SNR);
scatterplot(chanOut)
% Demodulate received signal
demodOut = qamdemod(chanOut,modOrder,"OutputType","bit","UnitAveragePower",true);

%Task 1
isBitError = srcBits ~=demodOut;


%Task 2
numBitErrors = nnz(isBitError)


%Task 3
BER = numBitErrors / numBits 
% for SNR >=20 we have ZERO BER
