function p = Polynomial(x,coefficients)
  
  p = 0.0; % f(x)
  nbrOfCoefficients = size(coefficients, 2);
  
  for i = 1:nbrOfCoefficients
    p = p + coefficients(i)*x^(i-1); % Evaluate an*x^n and add to sum of f(x)
  end
  
end

