function mutatedIndividual = Mutate(individual,pMut)

r = rand;
mutatedIndividual = individual;
if (pMut>r)
  indices = randperm(length(individual),2);
  mutatedIndividual(indices(1)) = individual(indices(2));
  mutatedIndividual(indices(2)) = individual(indices(1));
end

end
  


