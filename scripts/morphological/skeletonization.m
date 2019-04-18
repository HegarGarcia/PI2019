function out = skeletonization(img)
  mask = ones(3);
  prev_out = img;
  
  while (any(any(img)))
    prev_out = img;
    eroded = erode(img, mask);
    
    if (any(any(eroded)))
      img = img - eroded;
    else
      break
    endif
    
  endwhile
  
  out = prev_out;
  
endfunction
