populationSize = 40;
dimensions = 2;
variableRange = [-10,10];
cognitiveComponent = 2;
socialComponent = 2;
vMax = variableRange(2)*2;
inertiaWeight = 1.4;
inertiaReduceFactor = 0.99;
inertiaMin = 0.4;
alpha = 1;
deltaT = 1;
f = @Function;

bestValues = zeros(1,100);
bestIndividuals = zeros(100,2);

for i = 1:100
  
  individuals = zeros(3,3);
   
  for j = 1:3
    individual = EvaluateStandardPso(populationSize,dimensions,variableRange,cognitiveComponent,socialComponent,vMax,inertiaWeight,inertiaReduceFactor,inertiaMin,alpha,deltaT,f);
    individuals(j,:) = individual;
  end
  
  %Find best value and index corresponding to that individual.
  values = individuals(:,3);
  [bestVal,index] = min(values);
  bestIndividual = individuals(index,1:2);
   
  %Add best individual and it's value
  bestIndividuals(i,:) = bestIndividual;
  bestValues(i) = bestVal;
  
end

bestValues
bestIndividuals