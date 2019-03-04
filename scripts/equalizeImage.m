function [out] = equalizeimage(img, colorspace = 'rgb', layerRange = 1)
  colorspace = lower(colorspace);

  out = changecolorspace(img, 'rgb', colorspace);

  [x, y, z] = size(img);
  pixel_count = x * y;
  
  for layerNumber = layerRange
    layer = img(:, :, layerNumber);
    [ frequency ] = imhist(layer);
    lut = round((cumsum(frequency) / pixel_count) * 256);
    img(:, :, layerNumber) = intlut(uint8(layer), uint8(lut));
  end
  
  out = changecolorspace(img, colorspace, 'rgb');

  return(out);

end
