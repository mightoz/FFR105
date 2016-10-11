function error = CalculateError(output, targetOutput)
  %Note: output and targetOutput need to be rows
   
  %Error handling
  if(length(output)~=length(targetOutput))
    disp('Error: Output range mismatch'); %Fix proper error handling
  end
  
  k = length(output);
  
  difference = (output-targetOutput).^2;
  
  difference = difference*1/k;
  
  error = sqrt(sum(difference));
  
end