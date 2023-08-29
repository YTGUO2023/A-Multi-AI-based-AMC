trainingSetup = load("D:\Guo Yating\AMC_files\params_real.mat");

imdsTrain = imageDatastore("D:\Guo Yating\AMC_files\dataset\images\realData","IncludeSubfolders",true,"LabelSource","foldernames");
[imdsTrain, imdsValidation] = splitEachLabel(imdsTrain,0.7,"randomized");

% Resize the image to match the network input layer
augimdsTrain = augmentedImageDatastore([227 227 3],imdsTrain);
augimdsValidation = augmentedImageDatastore([227 227 3],imdsValidation);

opts = trainingOptions("sgdm",...
    "ExecutionEnvironment","auto",...
    "InitialLearnRate",0.01,...
    "MiniBatchSize",16,...
    "Shuffle","every-epoch",...
    "Plots","training-progress",...
    "ValidationData",augimdsValidation);

layers = [
    imageInputLayer([227 227 3],"Name","imageinput","Normalization","zscore","SplitComplexInputs",true)
    convolution2dLayer([3 3],16,"Name","conv","Padding","same")
    batchNormalizationLayer("Name","batchnorm")
    reluLayer("Name","relu")
    maxPooling2dLayer([5 5],"Name","maxpool","Padding","same")
    fullyConnectedLayer(100,"Name","fc_1")
    convolution2dLayer([3 3],32,"Name","conv_1","Padding","same")
    batchNormalizationLayer("Name","batchnorm_1")
    reluLayer("Name","relu_1")
    maxPooling2dLayer([5 5],"Name","maxpool_1","Padding","same")
    fullyConnectedLayer(100,"Name","fc_2")
    convolution2dLayer([3 3],64,"Name","conv_2","Padding","same")
    batchNormalizationLayer("Name","batchnorm_2")
    reluLayer("Name","relu_2")
    maxPooling2dLayer([5 5],"Name","maxpool_2","Padding","same")
    fullyConnectedLayer(100,"Name","fc_3")
    convolution2dLayer([3 3],128,"Name","conv_3","Padding","same")
    batchNormalizationLayer("Name","batchnorm_3")
    reluLayer("Name","relu_3")
    averagePooling2dLayer([5 5],"Name","avgpool2d","Padding","same")
    fullyConnectedLayer(5,"Name","fc")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];

[net, traininfo] = trainNetwork(augimdsTrain,layers,opts);

figure
% Loss_real = traininfo.TrainingLoss;
% Loss_10 = traininfo.TrainingLoss;
Loss_15 = traininfo.TrainingLoss;

plot(traininfo.TrainingLoss);
xlabel('Epochs');
ylabel('Training Loss');
title('Training Loss of SNR=15');

% net = trainNetwork(augimdsTrain,layers,opts);
% 
% YPred = classify(net,augimdsValidation,"MiniBatchSize",16);
% YTest = augimdsValidation.response;
% 
% accuracy = sum(YPred == YTest)/numel(YTest)
% 
% figure
% confusionchart(YPred,YTest)