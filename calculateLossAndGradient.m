function [lossVal, gradientVec] = calculateLossAndGradient(thetaMat, X, y, lamda)
trainingExCount = length(y); % number of training examples
predictions = 1.0 ./ (1.0 + exp(-X * thetaMat));
lossVal = (1/trainingExCount)*sum(((-1 .* y .* log(predictions))-((1 - y) .* (log(1 - predictions))))) ;
lossVal = lossVal + ((lamda / (2*trainingExCount)) * sum (thetaMat.^2)) - ((lamda / (2*trainingExCount)) * (thetaMat(1)*thetaMat(1)));
gradientArr = ((1/trainingExCount) .* (X' * (predictions - y)));
tempVar = thetaMat;
tempVar(1) = 0;
gradientArr = gradientArr + ((lamda/trainingExCount) .* tempVar);
gradientVec = gradientArr(:);
end
