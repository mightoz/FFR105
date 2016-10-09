function value = Function(position)
  x = position(1);
  y = position(2);
  value = 1 + (-13 + x - y^3 + 5*y^2 -2*y)^2 + (-29 + x + y^3 + y^2 - 14*y)^2;
end

