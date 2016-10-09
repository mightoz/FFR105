function winner = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize)

  selectedIndividuals = zeros(2,tournamentSize);
  
  % Randomly select tournamentSize # of candidates from fitness vector. Put
  % candidates in matrix with row 1 = fitness value and row 2 = index.
  for i = 1:tournamentSize
    selectedIndex = fix(length(fitness)*rand)+1; 
    fitnessValue = fitness(selectedIndex);
    selectedIndividuals(1,i) = fitnessValue;
    selectedIndividuals(2,i) = selectedIndex;
  end
  
  selectedIndividuals = sortrows(selectedIndividuals',-1)'; % Sort columns in descending order from row 1(fitness)

  % Remove candidate with highest fitness with prob 1-Ptour, while
  % #candidates > 1
  while(rand>tournamentSelectionParameter && (size(selectedIndividuals,2)>1))
    selectedIndividuals(:,1) = [];
  end

  winner = selectedIndividuals(2,1);

end