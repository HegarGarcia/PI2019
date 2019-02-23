function eq_img = EqualizeImage(img)
  img_gray = rgb2gray(img);
  
  [x, y] = size(img_gray);
  pixel_count = x * y;
  
  [ frequency ] = imhist(img_gray);
  lut = round((cumsum(frequency) / pixel_count) * 256);
  
  eq_img = intlut(img_gray, uint8(lut));
end
