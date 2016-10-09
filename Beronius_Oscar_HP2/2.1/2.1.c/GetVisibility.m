function visibility = GetVisibility(cityLocation)
  
  for i = 1:size(cityLocation,1)
    currentCity = cityLocation(i,:);
    
    for j = 1:size(cityLocation,1)
      x1=cityLocation(i,1);
      y1=cityLocation(i,2);
      x2=cityLocation(j,1);
      y2=cityLocation(j,2);
      distance = PathLength(x1,y1,x2,y2);
      visibility(i,j) = 1/distance;
    end
    
    
    %currentCityFrame = repmat(currentCity,size(cityLocation,1),1);
    %distanceFrame = cat(2,currentCityFrame,cityLocation);
    
    %distance = apply(distanceFrame, 1, PathLength)
    %distance = rowfun(handle,distanceFrame)
    %visibility = cat(1,visibility,distance)
    
    %distance = PlotPath(distanceFrame, 2)
  end
  visibility(logical(eye(size(visibility)))) = 0;
end