function out = hitmiss(img, ba, bb)
  out = erode(im, ba) & erode(!im, bb);
endfunction
