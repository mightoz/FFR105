function gradientDescent = GradientDescent(startingPoint,penalty,stepLength,threshold)

  sp = startingPoint;
  grad = 1;

  % While |Gradient| < threshold, keep descendning.
  while(norm(grad)>=threshold)
    grad = stepLength*Gradient(sp(1,1),sp(1,2),penalty);
    nextPoint = sp - grad;    
    sp = nextPoint;
  end
  
  gradientDescent = sp;
  