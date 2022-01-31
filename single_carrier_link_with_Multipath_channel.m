Single Carrier Link with Multipath Channel
Instructions are in the task pane to the left. Complete and submit each task one at a time.
This code sets up a 16-QAM link with filtering.
numBits = 20000;
modOrder = 16;  % for 16-QAM
bitsPerSymbol = log2(modOrder);  % modOrder = 2^bitsPerSymbol
txFilt = comm.RaisedCosineTransmitFilter;
rxFilt = comm.RaisedCosineReceiveFilter;

srcBits = randi([0,1],numBits,1);
modOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);
txFiltOut = txFilt(modOut);

Task 1
mpChan = [0.8,0,0,0,0,0,0,0,-0.5,0,0,0,0,0,0,0,0.34]';


Task 2
stem(mpChan)


Task 3
mpChanOut = filter(mpChan,1,txFiltOut);


The following code is executed after the variable mpChanOut is created.
if exist("mpChanOut","var")  % code runs after you complete Task 3
    
    SNR = 15;  % dB
    chanOut = awgn(mpChanOut,SNR,"measured");
    
    rxFiltOut = rxFilt(chanOut);
    scatterplot(rxFiltOut)
    title("Receive Filter Output")
    demodOut = qamdemod(rxFiltOut,modOrder,"OutputType","bit","UnitAveragePower",true);
    
    % Calculate the BER
    delayInSymbols = txFilt.FilterSpanInSymbols/2 + rxFilt.FilterSpanInSymbols/2;
    delayInBits = delayInSymbols * bitsPerSymbol;
    srcAligned = srcBits(1:(end-delayInBits));
    demodAligned = demodOut((delayInBits+1):end);

    numBitErrors = nnz(srcAligned~=demodAligned)
    BER = numBitErrors/length(srcAligned)
end

Further Practice
specAn = dsp.SpectrumAnalyzer("NumInputPorts",2,"SpectralAverages",50);
specAn(txFiltOut,chanOut)
