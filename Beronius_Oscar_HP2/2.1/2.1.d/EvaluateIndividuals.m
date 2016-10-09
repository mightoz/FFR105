function fitness = EvaluateIndividuals(individuals, cityLocations)

fitness = zeros(1,size(individuals,1));
for i = 1:size(individuals,1)
  pathLength = TotalPathLength(individuals(i,:),cityLocations);
  fitness(1,i) = 1/pathLength;
end

end