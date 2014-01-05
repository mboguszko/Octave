function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


%trials = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30 ];
%len = length(trials)

%evec = zeros(len*len,3);

%k=0
%for i=1:len
%  for j=1:len
%    k = k+1
%    C = trials(i);
%    sigma = trials(j);
%    evec(k,1) = C;
%    evec(k,2) = sigma;
%    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
%    pred  = svmPredict(model,Xval);
%    perr  = mean(double(pred ~= yval));
%    evec(k,3) = perr;
%  endfor
%endfor

%[ minval, imin ] = min(evec(:,3));

%[C, sigma] = evec(imin,1:2);

C = 1.00000;
sigma = 0.10000;


% =========================================================================

end
