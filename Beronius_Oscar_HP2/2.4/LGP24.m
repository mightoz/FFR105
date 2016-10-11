%-------Static parameters--------
m = 3; %Number of registers
n = 3; %Number of constants

%Function handles for operators {+,-,*,/}
f1 = @(a,b)a+b;
f2 = @(a,b)a-b;
f3 = @(a,b)a*b;
f4 = @(a,b)a/b;
operators = {f1,f2,f3,f4};

registers = zeros(1,m);
constants = [1,3,-1];
operands = [registers,constants];

numberOfGenes = 5;
geneSize = 4;
alleleRanges = [length(operators),m,m+n,m+n];

functionData = LoadFunctionData;
inputValues = functionData(:,1)';
targetOutput = functionData(:,2)';
%-------Static parameters--------

%-------Standard parameters------
populationSize = 100;
generations = 1;
pTour = 0.75;
tournamentSize = 2;
pMut = 0;
%-------Standard parameters------

currentGen = InitializeGeneration(populationSize,numberOfGenes,geneSize,alleleRanges);
%currentVals = EvaluateChromosome(currentGen(1),operands,operations,inputValues);
generationValues = EvaluateGeneration(currentGen,operands,operations,inputValues);
%generationFitness = CalculateGenerationFitness(generationValues,targetOutput);
%[bestFitness,index] = max(generationFitness);
%bestIndividual = currentGen(index,:);

% for gen = 1:generations
%   nextGen = currentGen;
%   
%   generationValues = EvaluateGeneration(currentGen,operands,operations,inputValues);
%   generationFitness = CalculateGenerationFitness(generationValues,targetOutput);
%   
%   [bestFitness,index] = max(generationFitness);
%   bestIndividual = currentGen(index,:);
%   
%   %Generate new generatin through tournament selection
%   for i = 1:populationSize
%     winnerIndex = TournamentSelect(generationFitness,pTour,tournamentSize);
%     winner = currentGen(winnerIndex,:);
%     nextGen(i,:) = winner;
%   end
%   
%   currentGen = nextGen;
% end
%bestValues = EvaluateChromosome(bestIndividual,operands,operations,inputValues)
%figure
%gplot(inputValues,targetOutput,inputValues,bestValues)


