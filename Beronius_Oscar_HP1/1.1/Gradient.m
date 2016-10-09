function gradient = Gradient(x1,x2,mu)

  penalty = mu; 
  constraintValue = x1^2 + x2^2 -1;
  
  % No penalty if constraint is fulfilled
  if(constraintValue <= 0)
    penalty = 0;
  end
  
  gradient = zeros(1,2);
  
  gradient(1,1) = 2*(x1-1) + 4*x1*penalty*(x1^2 + x2^2 -1);
  gradient(1,2) = 4*(x2-2) + 4*x2*penalty*(x1^2 + x2^2 -1);