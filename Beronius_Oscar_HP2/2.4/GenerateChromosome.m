function chromosome = GenerateChromosome(numberOfGenes,geneSize,alleleRanges)
 
  newChromosome = zeros(numberOfGenes,geneSize);
  
  for i = 1:numberOfGenes
    randomGene = GenerateGene(geneSize,alleleRanges);
    newChromosome(i,:) = randomGene;
  end
  
  %Make chromosome an array.
  chromosome = reshape(newChromosome',[1,numberOfGenes*geneSize]);
end