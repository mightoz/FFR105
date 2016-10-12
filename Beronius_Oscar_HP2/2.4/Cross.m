function [firstAfterCross,secondAfterCross] = Cross(chromosomeOne,chromosomeTwo,maxCrossoverLength)

    %First chromosome
    firstChromosome = chromosomeOne.Chromosome;    
    crossoverPointsFirst = GetCrossoverPoints(firstChromosome);
    firstChromosomeLen = length(firstChromosome);
    
    %Second chromosome
    secondChromosome = chromosomeTwo.Chromosome;   
    crossoverPointsSecond = GetCrossoverPoints(secondChromosome);
    secondChromosomeLen = length(secondChromosome);

     
    %Split up chromosomes
    firstBeginning = firstChromosome(1:crossoverPointsFirst(1)-1);
    firstMiddle = firstChromosome(crossoverPointsFirst(1):crossoverPointsFirst(2)-1);
    firstEnd = firstChromosome(crossoverPointsFirst(2):firstChromosomeLen);
    
    secondBeginning = secondChromosome(1:crossoverPointsSecond(1)-1);
    secondMiddle = secondChromosome(crossoverPointsSecond(1):crossoverPointsSecond(2)-1);
    secondEnd = secondChromosome(crossoverPointsSecond(2):secondChromosomeLen);
    
    %Build new chromosomes
    firstNew = [firstBeginning,secondMiddle,firstEnd];
    secondNew = [secondBeginning,firstMiddle,secondEnd];
    firstNewLen = length(firstNew);
    secondNewLen = length(secondNew);
    
    %Convert to structs and return
    firstAfterCross = struct('Chromosome',firstNew);
    secondAfterCross = struct('Chromosome',secondNew);
        
    function crossoverPoints = GetCrossoverPoints(chromosome)
      chromosomeLen = length(chromosome);
    
      %Indices of all genes in chromosome
      tmpIndices = 1:chromosomeLen;
      
      %Find every fourth index in chromosome
      everyFourthElement = find(mod(tmpIndices,4)==0);
      
      %Find indices of all gene starting points
      geneIndices = everyFourthElement-3;
      
      %Remove first gene from selection -> always split chromosome in 3.
      geneIndices(1) = [];
      
      numberOfGenes = length(geneIndices);
    
      %Randomly select two gene indexes
      crossoverIndices = randperm(numberOfGenes,2);
      
      %Retrieve each index
      firstCrossoverIndex = crossoverIndices(1);
      secondCrossoverIndex = crossoverIndices(2);
      
      %Retrieve each crossover point in chromosome
      firstCrossoverPoint = geneIndices(firstCrossoverIndex);
      secondCrossoverPoint = geneIndices(secondCrossoverIndex);
      
      %If crossover span includes more than maxCrossoverLength # of
      %instructions, limit amount of instructions to maxCrossoverLength
      if (secondCrossoverPoint-firstCrossoverPoint) > maxCrossoverLength*4;
        firstCrossoverPoint = secondCrossoverPoint -(maxCrossoverLength*4);
      end
      
      %Sort crossover points in ascending order and return
      crossoverPoints = sort([firstCrossoverPoint,secondCrossoverPoint]);
    
    end
end