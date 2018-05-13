This document contains the information pertaining to matlab files related to handwritten digit recognition based on logistic regression

Following files are available in the project folder along with their uses:
+ Root
|- t10k-labels.idx1-ubyte ---> testing data labels
|- train-labels.idx1-ubyte ---> training data labels
|- t10k-images.idx3-ubyte ---> testing images data
|- train-images.idx3-ubyte ---> training images data
|- readMNIST.m ---> library to import data from mnist dataset. Downloaded from mathworks.com.[Made a minor change to 	disable removing of padding]
|- recogChar.m ---> *Starting file of the project. Run this file to process everything*
|- loadedData.mat ---> Processed training data to save execution time.
|- gradDescent.m ---> Perform gradient descent on the given image vector
|- getImgVectorMatrix ---> Converts 2d - image vector set into a 2d matrix where each row represents one flattened image vector
|- calculateLossAndGradient.m ---> Calculates the loss value and gradient of the logisitc loss function
|- readme.txt ---> documentation for the project

Steps to run the project
1. Open recogChar.m
2. There is one variables importDataFromScratch in the file that govern the working of the project. If this variable is true, then it imports data from ubyte files and generates probabilty matrix. Else, it imports probMatrix.m [which contains preprocessed probability matrix]from project folder and uses that for later function. If this variable is kept as true, the processing time of the project will be significantly high.
3. Run the file. Based on value of above given variables the program will show desired result




