function out = close_img(img, mask)
  out = erode(dilatate(img, mask), mask);
endfunction
