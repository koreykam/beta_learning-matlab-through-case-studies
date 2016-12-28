% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by Neural Fitting app
% Created 20-Mar-2015 12:41:12
%
% This script assumes these variables are defined:
%
%   kaggle0x2EX10x2Etrain - input data.
%   kaggle0x2EY0x2Etrain - target data.
clear all; close all;
x = load('kaggle/kaggle.X1.train.txt');
x = x';
t = load('kaggle/kaggle.Y.train.txt');
t = t';
xtest = load('kaggle/kaggle.X1.test.txt');

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

% Create a Fitting Network
hiddenLayerSize = 50;
net = fitnet(hiddenLayerSize,trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 20/100;

% Train the Network
[net,tr] = train(net,x,t, 'useParallel','yes');

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y)
sq_performance = sqrt(performance)

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
f = figure; plotperform(tr),     saveas(f, 'plotperform_50.png','png');
f = figure; plottrainstate(tr),  saveas(f, 'plottrainstate_50.png','png');
f = figure; ploterrhist(e),      saveas(f, 'ploterrhist_50.png','png');
f = figure; plotregression(t,y), saveas(f, 'plotregression_50.png','png');
f = figure; plotfit(net,x,t),    saveas(f, 'plotfit_50.png','png');

Ye = sim(net, xtest');     % make predictions
Ye = Ye';
fh = fopen('predictions_NN_Matlab_50_neurons.csv','w');  % open file for upload
fprintf(fh,'ID,Prediction\n');      % output header line
for i=1:length(Ye),
    fprintf(fh,'%d,%d\n',i,Ye(i));  % output each prediction
end;
fclose(fh);                         % close the file

%{
11	?3	vrdmr	
10 Neurons - Your submission scored 0.61341, which is not an improvement of your best score. Keep trying!
20 Neurons - Your submission scored 0.61301, which is not an improvement of your best score. Keep trying!
50 Neurons - Your submission scored 0.62889, which is not an improvement of your best score. Keep trying!
%}


x = [0.660799377355, 0.373876476047, 0.365777491472, 0.362811768676, 0.361239546837, 0.360249113624, 0.359705538756, 0.35920295976,0.359318099876, 0.359109198878, 0.360801891091,  0.359335584592]
