tbl = readtable("In5_5000_SNR15.dat",'TextType','String');
labelName = "out_5000";
tbl = convertvars(tbl,labelName,'categorical');

numObservations = size(tbl,1);
numObservationsTrain = floor(0.7*numObservations);
numObservationsTest = numObservations - numObservationsTrain;

idx = randperm(numObservations);
idxTrain = idx(1:numObservationsTrain);
idxTest = idx(numObservationsTrain+1:end);

tblTrain = tbl(idxTrain,:);
tblTest = tbl(idxTest,:);

numFeatures = 5;
numClasses = 5;
 
layers = [
    featureInputLayer(numFeatures,'SplitComplexInputs',true,'Normalization', 'zerocenter')
    fullyConnectedLayer(100)
    batchNormalizationLayer
    reluLayer
    batchNormalizationLayer
    reluLayer
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

miniBatchSize = 64;

options = trainingOptions('sgdm', ...
    'MiniBatchSize',miniBatchSize, ...
    'MaxEpochs',50,...
    'InitialLearnRate',1e-2,...
    'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',false);

[net, traininfo] = trainNetwork(tblTrain,layers,options);

YPred = classify(net,tblTest,'MiniBatchSize',miniBatchSize);
YTest = tblTest{:,labelName};

accuracy = sum(YPred == YTest)/numel(YTest)

figure
cm = confusionchart(YPred,YTest);
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';
cm.Title = 'confusion chart, SNR=15';
% title('confusion chart ')


% Loss2 = traininfo.TrainingLoss;
% Loss3 = traininfo.TrainingLoss;
% Loss4 = traininfo.TrainingLoss;
% Loss5 = traininfo.TrainingLoss;
% 
% figure
% plot(Loss3,'b')
% hold on
% plot(Loss4,'r')
% hold on
% plot(Loss5,'g')
% 
% title('loss of net with 5000 samples')
% xlabel('Iteration')
% ylabel('Loss')
% legend('3 features','4 features','5 features')
% 
% figure
% Loss_real = traininfo.TrainingLoss;
% Loss_SNR10 = traininfo.TrainingLoss;
Loss_SNR15 = traininfo.TrainingLoss;
% 
% plot(Loss_real,'b')
% hold on
% plot(Loss_SNR10,'r')
% hold on
% plot(Loss_SNR15,'g')
% 
% title('loss of net with 5000 samples')
% xlabel('Iteration')
% ylabel('Loss')
% legend('real data','SNR = 10','SNR = 15')
% 
