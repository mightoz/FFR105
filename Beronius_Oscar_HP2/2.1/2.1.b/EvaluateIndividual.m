function fitness = EvaluateIndividual(individual, cityLocations)

pathLength = TotalPathLength(individual,cityLocations);
fitness = 1/pathLength;

end