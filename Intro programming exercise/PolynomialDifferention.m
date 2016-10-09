function differention = PolynomialDifferention(coefficients,order)

  nbrOfCoefficients = size(coefficients, 2);
  k = order-1;
  outputCoefficients = zeros(1, nbrOfCoefficients-1);
  
  % Calculate coefficients after differention
  for i = 1:nbrOfCoefficients
    n = (i-1)*coefficients(i);
    if(n~=0)
      outputCoefficients(i-1) = n;
    end   
  end
  
  %Perform differentiation order # of times, recursively
  if(k>0)
    differention = PolynomialDifferention(outputCoefficients, k);
  else
    differention = outputCoefficients;
  end
  
end
