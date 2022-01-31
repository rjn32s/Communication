Frequency Domain Equalization
Instructions are in the task pane to the left. Complete and submit each task one at a time.
This code sets the simulation parameters.
modOrder = 16;  % for 16-QAM
bitsPerSymbol = log2(modOrder)  % modOrder = 2^bitsPerSymbol

mpChan = [0.8; zeros(7,1); -0.5; zeros(7,1); 0.34];  % multipath channel
SNR = 100   % dB, signal-to-noise ratio of AWGN

Task 1
numCarr = 8192;
numBits = bitsPerSymbol*numCarr;


Create the source bit sequence and modulate using 16-QAM.
if exist("numBits","var")  % code runs after you complete Task 1
    srcBits = randi([0,1],numBits,1);
    qamModOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);
end

Task 2
cycPrefLen = 32;


Task 3
ofdmModOut = ofdmmod(qamModOut,numCarr,cycPrefLen);


Channel: multipath channel and AWGN
if exist("ofdmModOut","var")  % code runs after you complete Task 3
    mpChanOut = filter(mpChan,1,ofdmModOut);
    chanOut = awgn(mpChanOut,SNR,"measured");
end

Task 4
ofdmDemodOut = ofdmdemod(chanOut,numCarr,cycPrefLen);
scatterplot(ofdmDemodOut)

Task 5
mpChanFreq = fftshift(fft(mpChan,numCarr));


Task 6
eqOut = ofdmDemodOut ./ mpChanFreq
scatterplot(eqOut)

Demodulate back into bits, then calculate the BER.
if exist("eqOut","var")  % code runs after you complete Task 6
    qamDemodOut = qamdemod(eqOut,modOrder,"OutputType","bit","UnitAveragePower",true);
    numBitErrors = nnz(srcBits~=qamDemodOut)
    BER = numBitErrors/numBits
end

Further Practice




