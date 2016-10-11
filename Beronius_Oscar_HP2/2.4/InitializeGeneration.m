function generation = InitializeGeneration(populationSize,numberOfGenes,geneSize,alleleRanges)
  for i = 1:populationSize
    tmpChromosome = GenerateChromosome(numberOfGenes,geneSize,alleleRanges);
    chromosome = struct('Chromosome',tmpChromosome);
    generation(i) = chromosome;
  end
end