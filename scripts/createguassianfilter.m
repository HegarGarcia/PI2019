function [filter] = createguassianfilter(gridSize, sigma)
  xhalf = gridSize(1) / 2;
  yhalf = gridSize(2) / 2;
  
  xrange = round(-xhalf):round(xhalf);
  yrange = round(-yhalf):round(yhalf);

  stddeviation = (2 * sigma^2);
  
  [x, y] = meshgrid(xrange, yrange);
  filter = exp(-(x .^ 2 / stddeviation) - (y .^ 2 / stddeviation));
  filter = filter ./ sum(filter(:));
endfunction