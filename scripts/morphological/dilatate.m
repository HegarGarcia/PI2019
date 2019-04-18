function [out] = dilatate(img, structure)
  out = uint8(ordfiltn(img, sum(structure(:) != 0), structure, 0));
endfunction
