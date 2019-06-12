img = rgb2gray(imread('lena.bmp'));

## Filtro Minimo, Maximo y Mediana




## Filtro Gaussiano y Media

img_gaussian = imnoise(img, 'gaussian');

average_mask = fspecial('average');
gaussian_mask = fspecial('gaussian');
average_mask_5 = fspecial('average', 5);
gaussian_mask_5 = fspecial('gaussian', 5);

img_gaussian_gaussian = imfilter(img_gaussian, gaussian_mask);
img_gaussian_gaussian_5 = imfilter(img_gaussian, gaussian_mask_5);
img_gaussian_average = imfilter(img_gaussian, average_mask);
img_gaussian_average_5 = imfilter(img_gaussian, average_mask_5);

imwrite(img_gaussian, './outputs/img_gaussian.jpg');
imwrite(img_gaussian_gaussian, './outputs/img_gaussian_gaussian.jpg');
imwrite(img_gaussian_gaussian_5, './outputs/img_gaussian_gaussian_5.jpg');
imwrite(img_gaussian_average, './outputs/img_gaussian_average.jpg');
imwrite(img_gaussian_average_5, './outputs/img_gaussian_average_5.jpg');

figure('NumberTitle', 'off', 'Name', 'Filtro Gaussiano y Media');

subplot(2, 3, [1, 4]);
imshow(img_gaussian);
title('Ruido Gaussiano');

subplot(2, 3, 2);
imshow(img_gaussian_gaussian);
title('Ruido Gaussiano - Filtro Gaussiano (3)');

subplot(2, 3, 3);

imshow(img_gaussian_gaussian_5);
title('Ruido Gaussiano - Filtro Gaussiano (5)');

subplot(2, 3, 5);

imshow(img_gaussian_average);
title('Ruido Gaussiano - Filtro Media (3)');

subplot(2, 3, 6);

imshow(img_gaussian_average_5);
title('Ruido Gaussiano - Filtro Media (5)');

## Degradacion de imagen con Movimiento y Desenfoque

motion_mask = fspecial('motion');
blur_mask = fspecial('disk');

img_motion = imfilter(img, motion_mask);
img_motion_symmetric = imfilter(img, motion_mask, 'symmetric');
img_motion_replicate = imfilter(img, motion_mask, 'replicate');
img_motion_circular = imfilter(img, motion_mask, 'circular');
img_blur = imfilter(img, blur_mask);
img_blur_symmetric = imfilter(img, blur_mask, 'symmetric');
img_blur_replicate = imfilter(img, blur_mask, 'replicate');
img_blur_circular = imfilter(img, blur_mask, 'circular');

imwrite(img_motion, './outputs/img_motion.jpg');
imwrite(img_motion_symmetric, './outputs/img_motion_symmetric.jpg');
imwrite(img_motion_replicate, './outputs/img_motion_replicate.jpg');
imwrite(img_motion_circular, './outputs/img_motion_circular.jpg');
imwrite(img_blur, './outputs/img_blur.jpg');
imwrite(img_blur_symmetric, './outputs/img_blur_symmetric.jpg');
imwrite(img_blur_replicate, './outputs/img_blur_replicate.jpg');
imwrite(img_blur_circular, './outputs/img_blur_circular.jpg');

figure('NumberTitle', 'off', 'Name', 'Degradacion de imagen con Movimiento y Desenfoque');

subplot(2, 4, 1);
imshow(img_motion);
title('Degradacion de Movimiento');

subplot(2, 4, 2);
imshow(img_motion_symmetric);
title('Degradacion de Movimiento - Symmetric');

subplot(2, 4, 3);
imshow(img_motion_replicate);
title('Degradacion de Movimiento - Replicate ');

subplot(2, 4, 4);
imshow(img_motion_circular);
title('Degradacion de Movimiento - Circular');

subplot(2, 4, 5);
imshow(img_blur);
title('Degradacion de Desenfoque');

subplot(2, 4, 6);
imshow(img_blur_symmetric);
title('Degradacion de Desenfoque - Symmetric');

subplot(2, 4, 7);
imshow(img_blur_replicate);
title('Degradacion de Desenfoque - Replicate');

subplot(2, 4, 8);
imshow(img_blur_circular);
title('Degradacion de Desenfoque - Circular');
