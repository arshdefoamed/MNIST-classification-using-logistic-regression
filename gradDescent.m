function [X] = gradDescent(X,paddedTrainImgVecArr,matchingArr, maxIterCt)

stepVal = 0.5;  
i=0;
while i < abs(maxIterCt)     
 [lossVal, gradVal] = calculateLossAndGradient(X,paddedTrainImgVecArr,matchingArr, 0);         
 gradientVec = -gradVal;                    
 X = X + stepVal*gradientVec;   
 slopeVal=gradientVec'*gradientVec;
 fprintf('Iteration %4i | Cost: %4.6e\r',  i, slopeVal);
 if(slopeVal<0.0001)
     break;
 end
 i=i+1;
end

