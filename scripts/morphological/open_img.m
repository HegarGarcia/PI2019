function out = open_img(img, mask)
  out = dilatate(erode(img, mask), mask);
endfunction
