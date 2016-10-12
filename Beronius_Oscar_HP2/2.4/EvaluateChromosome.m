function values = EvaluateChromosome(chromosomeStruct,operands,operators,inputValues)

chromosome = chromosomeStruct.Chromosome;

for i = 1:size(inputValues,2)
  
  updatedRegisters = operands;
  currentInput = inputValues(i);
  updatedRegisters(1) = currentInput;
  
  for j = 1:4:length(chromosome)
    operationIndex = chromosome(j);
    destinationIndex = chromosome(j+1);
    operand1Index = chromosome(j+2);
    operand2Index = chromosome(j+3);
    
    operation = operators{operationIndex};
    operand1 = updatedRegisters(operand1Index);
    operand2 = updatedRegisters(operand2Index);
    
    %Avoid divide by zero, set value to high.
    if(operationIndex == 4 && operand2 == 0)
      updatedRegisters(destinationIndex) = 100000;
    else
      value = operation(operand1,operand2);
      updatedRegisters(destinationIndex) = value;
    end
    
    %If we are evaluating last gene, set return value
    if(j == length(chromosome)-3)
      values(i) = updatedRegisters(destinationIndex);
    end
    
  end
  
end
end