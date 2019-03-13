function [out] = filter_maximum(img, mask_size) 
  
  last_element = mask_size * mask_size;
  
  out = ordfilt2(img, last_element, ones(mask_size, mask_size));
  
endfunction