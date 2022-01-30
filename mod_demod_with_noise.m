16-QAM Link with AWGN
Instructions are in the task pane to the left. Complete and submit each task one at a time.
This code sets up the simulation.
% Simulation parameters
numBits = 20000
modOrder = 16  % for 16-QAM

% Create source bit sequence
srcBits = randi([0,1],numBits,1);

%Task 1
modOut = qammod(srcBits,modOrder,"InputType","bit","UnitAveragePower",true);


%Task 2
% Add noise to the Modulated signal
SNR = 15 %dB
chanOut = awgn(modOut , SNR);


%Task 3
% Scatter plot
scatterplot(chanOut)

%Task 4
demodOut = qamdemod(chanOut,modOrder,...
    "OutputType","bit",...
    "UnitAveragePower",true);
check = isequal(srcBits,demodOut)
