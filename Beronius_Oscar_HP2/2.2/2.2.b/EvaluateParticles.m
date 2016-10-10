function evaluated = EvaluateParticles(particlePositions, f)
  
  for i = 1:size(particlePositions,1)
    currentPos = particlePositions(i,:);
    value = f(currentPos);
    evaluated(i) = value;
  end
  
end