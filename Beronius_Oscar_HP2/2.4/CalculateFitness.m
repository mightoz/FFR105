function fitness = CalculateFitness(output,targetOutput)
  %Note: output and targetOutput need to be rows
  %output
  %targetOutput
  err = CalculateError(output,targetOutput);
  if(err == 0)
    fitness = inf;
  else
    fitness = 1/err;
  end
end