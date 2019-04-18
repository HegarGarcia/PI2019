close all;
clear all;

img = imread("lena_gray.bmp");
img_if = fft2(img);

filter_average = fft2(fspecial("average"), 512, 512);
%filter_disk = fft2(fspecial("disk"), 512, 512);
%filter_laplacian = fft2(fspecial("laplacian"), 512, 512);
%%filter_movement = fft2(fspecial("motion"), 512, 512);

result_average = img_if .* filter_average;
%result_disk = img_if .* filter_disk;
%result_laplacian = img_if .* filter_laplacian;
%result_movement = img_if .* filter_movement;

Im = abs(fftshift(filter_average));

% Show filter
figure, colormap hsv, mesh(Im(1:10:end, 1:10:end));
%figure, imshow(abs(fftshift(filter_movement)), []);

% Show images with filter
%figure, colormap hsv, mesh(log(abs(fftshift(result_movement)) + 1));
%figure, imshow(log(abs(fftshift(result_movement)) + 1), []);

%figure, imshow(ifft2(result_average), []);