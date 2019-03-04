function compareimages(img1, img2) 
  figure(1);
  
  subplot(2, 2, 1);
  imshow(img1);
  title('Image 1');

  subplot(2, 2, 2);
  imhist(img1);
  title('Histogram');
  
  subplot(2, 2, 3);
  imshow(img2);
  title('Image 2');

  subplot(2, 2, 4);
  imhist(img2);
  title('Histogram');
end
