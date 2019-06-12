function [out] = filter_median(img, mask_size) 
  
  last_element = ceil((mask_size * mask_size) / 2);
  
  out = ordfilt2(img, last_element, ones(mask_size, mask_size));
  
endfunction