Filter Delay and BER Calculation
Instructions are in the task pane to the left. Complete and submit each task one at a time.
This code simulates a 16-QAM link with filtering and AWGN.
numBits = 20000;
modOrder = 16;  % for 16-QAM
bitsPerSymbol = log2(modOrder)  % modOrder = 2^bitsPerSymbol
txFilt = comm.RaisedCosineTransmitFilter;
rxFilt = comm.RaisedCosineReceiveFilter;

srcBits = randi([0,1],numBits,1);
modOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);
txFiltOut = txFilt(modOut);

SNR = 7;  % dB
chanOut = awgn(txFiltOut,SNR,"measured");

rxFiltOut = rxFilt(chanOut);
demodOut = qamdemod(rxFiltOut,modOrder,"OutputType","bit","UnitAveragePower",true);

Task 1
delayInSymbols = rxFilt.FilterSpanInSymbols/2 + txFilt.FilterSpanInSymbols/2


Task 2
delayInBits = delayInSymbols * bitsPerSymbol


Task 3
srcAligned = srcBits(1:(end-delayInBits))


Task 4
demodAligned = demodOut((delayInBits+1):end)


Task 5



Task 6



Further Practice
% specAn = dsp.SpectrumAnalyzer("NumInputPorts",2,"SpectralAverages",50);
% specAn(txFiltOut,chanOut)


