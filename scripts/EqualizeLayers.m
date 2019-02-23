function img = EqualizeLayers(img, colorspace = 'rgb', layerRange = 1)
  colorspace = lower(colorspace);
  
  if strcmp(colorspace, 'gray')
    img = rgb2gray(img);
  elseif strcmp(colorspace, 'ycbcr')
    img = rgb2ycbcr(img);
  elseif strcmp(colorspace, 'hsv')
    img = rgb2hsv(img);
  elseif strcmp(colorspace, 'hsi')
    img = rgb2hsi(img);
  end

  [x, y, z] = size(img);
  pixel_count = x * y;
  
  for layerNumber = layerRange
    layer = img(:, :, layerNumber);
    [ frequency ] = imhist(layer);
    lut = round((cumsum(frequency) / pixel_count) * 256);
    img(:, :, layerNumber) = intlut(uint8(layer), uint8(lut));
  end
  
  if strcmp(colorspace, 'gray')
    img = cat(3, img, img, img);
  elseif strcmp(colorspace, 'ycbcr')
    img = ycbcr2rgb(img);
  elseif strcmp(colorspace, 'hsv')
    img = hsv2rgb(img);
  elseif strcmp(colorspace, 'hsi')
    img;
  end
end
