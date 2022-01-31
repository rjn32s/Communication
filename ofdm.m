%OFDM Modulation with IFFT
%Instructions are in the task pane to the left. Complete and submit each task one at a time.
%This code sets up a 16-QAM link.
numBits = 32768;  % power of 2, to optimize performance of fft/ifft
modOrder = 16;  % for 16-QAM

srcBits = randi([0,1],numBits,1);
qamModOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);
scatterplot(qamModOut)
title("16-QAM Signal")

Task 1
ofdmModOut = ifft(qamModOut);


Apply AWGN.
if exist("ofdmModOut","var")  % code runs after you complete Task 1
    SNR = 15;  % dB
    chanOut = awgn(ofdmModOut,SNR,"measured");
end

Task 2
ofdmDemodOut = fft(chanOut)


Task 3
scatterplot(ofdmDemodOut)


Demodulate back into bits, then calculate the BER.
if exist("ofdmDemodOut","var")  % code runs after you complete Task 2
    qamDemodOut = qamdemod(ofdmDemodOut,modOrder,"OutputType","bit","UnitAveragePower",true);
    numBitErrors = nnz(srcBits~=qamDemodOut)
    BER = numBitErrors/numBits
end

Further Practice




