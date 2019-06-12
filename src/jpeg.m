img = rgb2gray(imread('landscape.jpg'));
%
%img_if = fft2(double(img));
%img_eif = abs(img_if);
%img_eif = fftshift(img_eif);
%img_eif = log(img_eif + 1);
%
%[rows, cols, ~] = size(img_eif);
%x_center = rows / 2
%y_center = cols / 2
%radius = 40;
%
%[xx,yy] = ndgrid((1:rows) - y_center, (1:cols) - x_center);
%mask = (xx.^2 + yy.^2)<radius^2;
%
%subplot(2, 2, 1);
%imshow(img);
%
%subplot(2, 2, 2);
%imshow(log(img_eif + 1), []);
%
%cicle = img_eif;
%cicle(mask) = uint8(0);
%
%subplot(2, 2, 3);
%imshow(log(circle + 1), []);

img_if = fft2(double(img));
[rows, cols] = size(img_if);
window = 15;

img_if = fftshift(img_if);

img_if(1:window, 1:window) = 0;
img_if(1:window, cols - (window - 1):cols) = 0;
img_if(rows - (window -1 ):rows, 1:window) = 0;
img_if(rows - (window -1 ):rows, cols - (window - 1):cols) = 0;

img_ifg = (abs(img_if));
figure, imshow(log(img_ifg + 1), []);

img_it = real(ifft2(img_if));
# figure, imshow(uint8(img_it));

for i = 1:rows*cols
  if img_it(i) > 20
    img_it(i) = 255;
  else
    img_it(i) = 0;
  endif
endfor

# figure, imshow(img_it);