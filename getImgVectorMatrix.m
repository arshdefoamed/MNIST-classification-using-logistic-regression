function [imgVecMatrix] = getImgVectorMatrix(imgSet,imgCount)
imgVecMatrix= zeros(size(imgSet,1)*size(imgSet,2),imgCount);
for i = 1:imgCount
    imgObj= imgSet(:,:,i);
    imgVecMatrix(:,i)=imgObj(:);
end
imgVecMatrix = imgVecMatrix';
