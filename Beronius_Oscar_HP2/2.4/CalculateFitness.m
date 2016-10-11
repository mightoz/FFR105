function fitness = CalculateFitness(output,targetOutput)
  %Note: output and targetOutput need to be rows
  %output
  %targetOutput
  err = CalculateError(output,targetOutput);
  
  fitness = 1/err;
end