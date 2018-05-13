clc;clear;close all;
importDataFromScratch = true;
tic;
trainImgSetSize = 60000; % training data size
testSetSize = 10000;  % test data size
disp('Loading data');
if importDataFromScratch    
    [trainingImgs,trainingLabels] = readMNIST('train-images.idx3-ubyte', 'train-labels.idx1-ubyte', trainImgSetSize, 0); % import training data
    [testImgs,testLabels] = readMNIST('t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte', testSetSize, 0); % import test data
else
    load('loadedData.mat');
end
disp('Data loaded');
trainImgCount=trainImgSetSize;
testImgCount=testSetSize;
trainImgVecArr=getImgVectorMatrix(trainingImgs,trainImgCount);
testImgVecArr=getImgVectorMatrix(testImgs,testImgCount);
trainLabels = trainingLabels(1:trainImgCount)+1;
testLabels = testLabels(1:testImgCount)+1;

paddedTrainImgVecArr = [ones(trainImgCount, 1) trainImgVecArr];
paddedTestImgVecArr = [ones(testImgCount, 1) testImgVecArr];
featureCount = size(trainImgVecArr, 2);
thetaMat = zeros(10, featureCount + 1);
uniqueLabelsList = unique(trainLabels);
K=10;
disp('Training classifier');
for i = 1 : K
 	initial_theta = zeros(featureCount+1, 1);
    
    [theta]= gradDescent(initial_theta, paddedTrainImgVecArr,(trainLabels == uniqueLabelsList(i)),200);    

    thetaMat(i,:) = theta(:);
    disp([ num2str((i/K)*100) ' percent completed'])
end
disp('Training completed');
p = zeros(size(paddedTrainImgVecArr, 1), 1);
predictionProbArr = paddedTrainImgVecArr * thetaMat' ;
[Yhat,prediction] = max(predictionProbArr,[],2);
disp(['Training accuracy is: ' num2str(mean(double(prediction == trainLabels)) * 100) ' percent'] )

p = zeros(size(paddedTestImgVecArr, 1), 1);
predictionProbArr = paddedTestImgVecArr * thetaMat' ;
[Yhat,prediction] = max(predictionProbArr,[],2);
disp(['Test accuracy is: ' num2str(mean(double(prediction == testLabels)) * 100) ' percent'] )
toc;