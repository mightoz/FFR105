function shuffledPath = Shuffle(path)

  shuffledPath = path;
  %Random number of shuffles 3-10.
  shuffles = randi([3 10]);
  
  %Random permutation of length shuffles*2. 
  r = randperm(length(path),shuffles*2);
  
  %Shuffle indexes pair-wise
  for i = 1:2:length(r)
    first = r(i);
    second = r(i+1);
    
    shuffledPath(first) = second;
    shuffledPath(second) = first;
  end
end