%profile on
%-------Static parameters--------
m = 3; %Number of registers
n = 4; %Number of constants

%Function handles for operators {+,-,*,/}
f1 = @(a,b)a+b;
f2 = @(a,b)a-b;
f3 = @(a,b)a*b;
f4 = @(a,b)a/b;
operators = {f1,f2,f3,f4};

registers = zeros(1,m);
constants = [1,3,-1,0];
operands = [registers,constants];

numberOfGenesRange = [5,25];
geneSize = 4;
alleleRanges = [length(operators),m,m+n,m+n];

functionData = LoadFunctionData;
inputValues = functionData(:,1)';
targetOutput = functionData(:,2)';
%-------Static parameters--------

%-------Standard parameters------
populationSize = 100;
generations = 5000;
pTour = 0.75;
tournamentSize = 5;
pCross = 0.2;
%-------Standard parameters------

%-------Custom parameters--------
maxCrossoverLength = 5;
%-------Custom parameters--------

currentGen = InitializeGeneration(populationSize,numberOfGenesRange,geneSize,alleleRanges);
currentVals = EvaluateChromosome(currentGen(1),operands,operators,inputValues);
generationValues = EvaluateGeneration(currentGen,operands,operators,inputValues);
generationFitness = CalculateGenerationFitness(generationValues,targetOutput);
[bestFitness,index] = max(generationFitness)
bestIndividual = currentGen(index);

for gen = 1:generations
  
  nextGen = currentGen;
  
  generationValues = EvaluateGeneration(currentGen,operands,operators,inputValues);
  generationFitness = CalculateGenerationFitness(generationValues,targetOutput);
  
  [bestFitnessForGen,index] = max(generationFitness);
  bestIndividualForGen = currentGen(index);
  
  if(bestFitnessForGen > bestFitness)
    bestFitness = bestFitnessForGen
    bestIndividual = bestIndividualForGen;
    genNbr = gen
  end
  
  %Generate new generatin through tournament selection
  for i = 1:populationSize
    winnerIndex = TournamentSelect(generationFitness,pTour,tournamentSize);
    winner = currentGen(winnerIndex);
    nextGen(i) = winner;
  end
  
  nextGen = PerformCrossover(nextGen,pCross,maxCrossoverLength);
  nextGen = PerformMutation(nextGen,alleleRanges);
  
  nextGen(1) = bestIndividual;
  currentGen = nextGen;
end
bestIndividual
bestValues = EvaluateChromosome(bestIndividual,operands,operators,inputValues);
bestFitness
lowestError = CalculateError(bestValues,targetOutput)
figure
plot(inputValues,targetOutput,inputValues,bestValues);

%profile viewer

