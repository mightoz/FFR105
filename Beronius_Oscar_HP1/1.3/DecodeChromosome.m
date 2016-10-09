function x = DecodeChromosome(chromosome,nbrOfVariables,variableRange)
  
  m = size(chromosome,2);
  n = nbrOfVariables;
  k = m/n;
  
  xs = zeros(n,k); % Matrix containing variables on binary form, where each row is a variable
  vars = zeros(1,nbrOfVariables);
  
  for i = 1:n  
    for j = 1:k     
      alleleIndex = (i-1)*k + j;
      xs(i,j) = chromosome(1,alleleIndex);
    end  
  end
 
  for i = 1:n 
    var = 0.0;   
    for j = 1:k
      var = var + xs(i,j)*2^(-j);
    end
    var = -variableRange + 2*variableRange*var/(1 - 2^(-k));
    vars(i) = var; 
  end
  
  x = vars;
      
end