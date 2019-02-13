function DivideImg()
  img = imread('../Images/nasa.jpg');
  
  red = img(:, :, 1);
  green = img(:, :, 2);
  blue = img(:, :, 3);
  
  allBlack = zeros(size(img, 1), size(img, 2));

  just_red = cat(3, red, allBlack, allBlack);
  just_green = cat(3, allBlack, green, allBlack);
  just_blue = cat(3, allBlack, allBlack, blue);
  
  recombinedRGBImage = cat(3, red, green, blue);
  
  subplot(3, 3, 2);
  imshow(img);
  fontSize = 20;
  title('RGB Image', 'FontSize', fontSize)
  
  subplot(3, 3, 4);
  imshow(just_red);
  title('Red Channel', 'FontSize', fontSize)
  
  subplot(3, 3, 5);
  imshow(just_green)
  title('Green Channel', 'FontSize', fontSize)
  
  subplot(3, 3, 6);
  imshow(just_blue);
  title('Blue Channel', 'FontSize', fontSize)
  
  subplot(3, 3, 8);
  imshow(recombinedRGBImage);
  title('RGB Image Again', 'FontSize', fontSize)
end
