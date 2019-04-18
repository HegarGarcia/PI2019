function [out] = erode(img, structure)
  out = uint8(ordfiltn(img, 1, structure, 0));
endfunction
