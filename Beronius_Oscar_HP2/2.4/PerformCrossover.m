function crossedGeneration = PerformCrossover(generation,pCross)
  nbrOfIndividuals = size(generation,1);
  
  for i = 1:2:nbrOfIndividuals 
    r = rand;
    firstChromosome = generation(i);
    secondChromosome = generation(i+1);
    if(pCross>r)
      [firstChromosome,secondChromosome] = Cross(firstChromosome, secondChromosome);
    end    
    crossedGeneration(i) = firstChromosome;
    crossedGeneration(i+1) = secondChromosome;

  end 
end
