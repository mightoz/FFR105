function generation = InitializeGeneration(populationSize,numberOfGenesRange,geneSize,alleleRanges)
  for i = 1:populationSize
    numberOfGenes = randi(numberOfGenesRange);
    tmpChromosome = GenerateChromosome(numberOfGenes,geneSize,alleleRanges);
    chromosome = struct('Chromosome',tmpChromosome);
    generation(i) = chromosome;
  end
end