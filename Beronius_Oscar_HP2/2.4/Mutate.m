function mutatedChromosome = Mutate(chromosome,alleleRanges)
  chromosome = chromosome.Chromosome;
  chromosomeLength = length(chromosome);
  pMut = 1/chromosomeLength;
  alleleIndices = [1:4];
  
  %Loop through every four alleles in chromomsome
  for i = 1:4:chromosomeLength   
    for j = 1:4
      r = rand;
      %Mutate specific allele with prob pMut.
      if(pMut>r)
        %Range of current allele
        currentRange = alleleRanges(j);
        %Choose random value in range
        mutatedAllele = randperm(currentRange(end),1);   
        %Update allele with new value
        chromosome(i+j-1) = mutatedAllele;
      end
    end
  end
   
  mutatedChromosome = struct('Chromosome',chromosome);
end