function mutatedIndividual = Mutate(individual,pMut)

mutatedIndividual = individual;
% for i = 1:length(individual)
%   r = rand;
%   if(pMut>r)
%     %Choose first allele according to mutation rate
%     firstAllele = individual(i);
%     %Second allele is chosen randomly amongst the remaining alleles
%     secondAllele = randi([i,length(individual)]);
%     %Swap alleles
%     mutatedIndividual(firstAllele) = individual(secondAllele);
%     mutatedIndividual(secondAllele) = individual(firstAllele);
%     break
%   end  
% end
r = rand;
if (pMut>r)
  indices = randperm(length(individual),2);
  mutatedIndividual(indices(1)) = individual(indices(2));
  mutatedIndividual(indices(2)) = individual(indices(1));
end

end
  


