function plt = PlotIterations(polynomialCoefficients,iterationValues)
  
  coefficients = fliplr(polynomialCoefficients); % Flipped arrangement of coefficients. 
  ys = zeros(1, 0); % Vector of function values
  
  % For all iterationValues, calculate function values and add to vector.
  for i = 1:(size(iterationValues, 2))
    ys(end+1) = Polynomial(iterationValues(i), polynomialCoefficients);
  end
  
  x = linspace(min(iterationValues)-0.1, max(iterationValues)+0.1); % Interval of polynomial.
  px = polyval(coefficients,x); 
  
  figure;
  plot(x, px) % Plot polynomial.
  axis([min(iterationValues)-0.3 max(iterationValues)+0.3 min(ys)-1 max(ys)+1])
  hold on;
  plot(iterationValues, ys, 'O') % Plot points.
 
end