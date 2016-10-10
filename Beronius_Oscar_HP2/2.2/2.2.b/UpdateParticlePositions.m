function positions = UpdateParticlePositions(particlePositions, particleVelocities, deltaT)
 positions = particlePositions + particleVelocities*deltaT;
end