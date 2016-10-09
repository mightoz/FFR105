function f = NewtonRaphson(coefficients,startingPoint,tolerance)
  
  xj = startingPoint; % Value at starting point
  fPrim = Polynomial(startingPoint, PolynomialDifferention(coefficients,1));
  fBis = Polynomial(startingPoint, PolynomialDifferention(coefficients,2));
  
  % Show warning if differentiation returns empty vector.
  if(fPrim == 0 || fBis == 0)
    h = msgbox('Bad coefficient input. Number of coefficients should be more than 2.')
    f = 0;
    return
  end
  
  xm = NewtonRaphsonStep(xj, fPrim, fBis); % Xj+1
  
  f = zeros(1, 0); % Vector of iteration points
  
  f(end+1) = xj;
  
  % While condition |Xj+1-Xj| is not fulfilled, perform Newton Raphson
  % step with latest step point.
  while(abs(xm-xj) >= tolerance)   
    f(end+1) = xm;
    
    xj = xm;
    fPrim = Polynomial(xm, PolynomialDifferention(coefficients, 1));
    fBis = Polynomial(xm, PolynomialDifferention(coefficients, 2));
    xm = NewtonRaphsonStep(xj, fPrim, fBis);  
  end
    
end