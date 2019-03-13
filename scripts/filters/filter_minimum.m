function [out] = filter_minimum(img, mask_size) 
  
  out = ordfilt2(img, 1, ones(mask_size, mask_size));
  
endfunction