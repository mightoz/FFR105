function penaltyMethod = PenaltyMethod()

  stepLength = 0.0001;
  threshold = 0.000001;
  penalty = [1 10 100 1000];
  x1 = zeros(1,1);
  x2 = zeros(1,1);
  startingPoint = [1 2];
  
  for i = 1:length(penalty)
    x = GradientDescent(startingPoint,penalty(i),stepLength,threshold);
    x = round(x,3);
    x1(i) = x(1);
    x2(i) = x(2);
  end
  
  % Make columns and variable names for printing
  penalty = penalty'; 
  x1 = x1';
  x2 = x2';
  columnNames = {'Mu';'X1';'X2'};
  penaltyMethod = table(penalty,x1,x2,'VariableNames',columnNames);
