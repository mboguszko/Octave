function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%   neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

z2 = [ones(m, 1) X]*Theta1';
a2 = sigmoid(z2);
m2 = size(a2,1);
z3 = [ones(m2,1),a2]*Theta2';
a3 = sigmoid(z3);
h  = a3;

% Transform y from class number to vector form
y1 = zeros(size(a3));
for i=1:m
  y1(i,y(i)) = 1;
endfor

J1 = y1.*log(h);
J2 = (1-y1).*log(1-h);
J3 = -1/m*sum(sum(J1+J2));


% Cost of the regularization term:
J4 = sum(sum(Theta1(:,2:end).^2));
J5 = sum(sum(Theta2(:,2:end).^2));
J6 = lambda/(2*m)*(J4+J5);

J  = J3+J6;

%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%

Delta1 = zeros(size(Theta1));
Delta2 = zeros(size(Theta2));

for t = 1:m
  a1 = [1; X(t,:)'];
  z2 = Theta1*a1;
  a2 = sigmoid(z2);
  z3 = Theta2* [1; a2 ];
  a3 = sigmoid(z3);
  yk = y1(t,:)';

  delta3 = a3 - yk;
  delta2 = (Theta2'*delta3)(2:end,:) .* sigmoidGradient(z2);
  
  Delta2 = Delta2 + delta3*[ 1; a2 ]';
  Delta1 = Delta1 + delta2*a1';
endfor

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

T1 = Theta1;
T1(:,1)=0;

T2 = Theta2;
T2(:,1)=0;

Theta1_grad = 1/m*Delta1 + lambda/m*T1;
Theta2_grad = 1/m*Delta2 + lambda/m*T2;

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
