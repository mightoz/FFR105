function [firstAfterCross,secondAfterCross] = Cross(chromosomeOne,chromosomeTwo)

    %First chromosome
    firstChromosome = chromosomeOne.Chromosome;
    
    firstChromosomeLen = length(firstChromosome);
    
    %Indices of all gene beginnings in chromosome
    geneIndicesFirst = 1:firstChromosomeLen;
    geneIndicesFirst = find(mod(geneIndicesFirst,4)==0);
    
    %Make two points of crossover in chromosome
    crossOverPointsFirst = sort(datasample(geneIndicesFirst,2)); %TODO: Maybe fix coding conventions.
     
    %Second chromosome
    secondChromosome = chromosomeTwo.Chromosome;
    
    secondChromosomeLen = length(secondChromosome);
    
    %Indices of all gene beginnings in chromosome
    geneIndicesSecond = 1:secondChromosomeLen;
    geneIndicesSecond = find(mod(geneIndicesSecond,4)==0);
    
    %Make two points of crossover in chromosome
    crossOverPointsSecond = sort(datasample(geneIndicesSecond,2)); %TODO: Maybe fix coding conventions.
    
    %Split up chromosomes
    firstBeginning = firstChromosome(1:crossOverPointsFirst(1));
    firstMiddle = firstChromosome(crossOverPointsFirst(1):crossOverPointsFirst(2));
    firstEnd = firstChromosome(crossOverPointsFirst(2):firstChromosomeLen);
    
    secondBeginning = secondChromosome(1:crossOverPointsSecond(1));
    secondMiddle = secondChromosome(crossOverPointsSecond(1):crossOverPointsSecond(2));
    secondEnd = secondChromosome(crossOverPointsSecond(2):secondChromosomeLen);
    
    %Cross
    firstChromosome = [firstBeginning,secondMiddle,firstEnd];
    secondChromosome = [secondBeginning,firstMiddle,secondEnd];
    
    firstAfterCross = struct('Chromosome',firstChromosome);
    secondAfterCross = struct('Chromosome',secondChromosome);
end