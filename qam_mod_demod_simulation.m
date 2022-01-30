% Generating the Input Sequence
srcBits = randi([0,1] , 20000,1);
% Making the order of 16-QAM
modOrder = 16;
% Now let's modulate the signal
modOut = qammod(srcBits , modOrder, "InputType" , "bit");
% Now let's look at the Constillation of QAM signal
scatterplot(modOut)
% For ideal channel no noise
chanOut = modOut;
%Now demodulate the signal
demodOut = qamdemod(chanOut , modOrder , "OutputType" , "bit");
% Let's check if the input output bit's are equal
check = isequal(srcBits,demodOut);
