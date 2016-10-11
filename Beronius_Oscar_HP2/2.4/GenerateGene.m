function gene = GenerateGene(geneSize, alleleRanges)

  for i = 1:geneSize
    currentRange = alleleRanges(i);
    %Initialize current allele to random number in given range
    allele = randi([1,currentRange]);
    gene(i) = allele;
  end
end