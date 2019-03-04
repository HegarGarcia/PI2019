function [out] = changecolorspace(img, from = 'rgb', to = 'rgb')  

  switch from
    case 'hsi'
      out = hsi2rgb(img);
    case 'hsv'
      out = hsv2rgb(img);
    case 'ycbcr'
      out = ycbcr2rgb(img);
    case 'gray'
      out = rgb2gray(img);
  end  
    
  switch to
    case 'hsv'
      out = rgb2hsv(out);
    case 'hsi'
      out = rgb2hsi(out);
    case 'ycbcr'
      out = rgb2ycbcr(out);
   end  
    
end
