function f = ParseGene(gene, operands, operations)
  operationIndex = gene(1)
  %destinationIndex = gene(2);
  operandOne = gene(3)
  operandTwo = gene(4)
  
  %f = operands(destinationIndex);
  operation = operations(operationIndex);
  operand1 = operands(operandOne)
  operand2 = operands(operandTwo)
  
  str = @(operand1+operation+operand2@;
  f = str2func(str);
  
end