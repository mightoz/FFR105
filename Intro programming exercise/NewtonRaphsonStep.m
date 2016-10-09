function stepValue = NewtonRaphsonStep(xj,fPrim,fBis)
  %Xj+1 = Xj - f'(Xj)/f''(Xj)
  stepValue = xj - (fPrim/fBis); 
end