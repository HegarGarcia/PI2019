function [outImage] = ResizeImage(img, colorSpace, ratio, layerRange, decompress) 
  
  rows = size(img, 1);
  cols = size(img, 2);
  outImage = zeros([rows * ratio, cols * ratio, 3]);
  
  intRows = ceil([1:(rows * ratio)]./(ratio));
  intCols = ceil([1:(cols * ratio)]./(ratio));
  
  for layerNumber = layerRange
    disp(layerNumber)
    layer = img(:, :, layerNumber);
    layer = layer(intRows, :);
    outImage(:, :, layerNumber) = layer(:, intCols);
  end
  
  if decompress == true
    invRatio = (floor(rows * ratio) / rows);
    outImage = ResizeImage(outImage, '', 1 / invRatio, layerRange, false);
    notCompressedLayers = setdiff(1:3, layerRange);
    
    for layerNumber = notCompressedLayers
      outImage(:, :, layerNumber) = img(:, :, layerNumber);
    end
  end
  
  outImage = uint8(outImage);
  
end