function totalLength = GetPathLength(path,cityLocations)

totalLength = 0;
for i = 1:length(path)  
  from = cityLocations(path(i),:);
  to = zeros(1,2); 
  
  if (i == length(path))
    to = cityLocations(path(1),:);
  else
    to = cityLocations(path(i+1),:);
  end
  
  len = sqrt((to(1)-from(1))^2+(to(2)-from(2))^2);
  totalLength = totalLength + len; 
end

end