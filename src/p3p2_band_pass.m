close all;
clear all;

# Leer imagen
img = imread("lena.bmp");

# Imagen en double y escala de grises
img = double(rgb2gray(img));

# Aplicar FFT
img_if = fft2(img);
[rows, columns] = size(img_if);

# Obtener tamaño de ventana
window_outer_size = input("Tamaño de ventana externa: ");
window_inner_size = input("Tamaño de ventana interna: ");

# Crear mascara
mask = ones(rows, columns);
center_x = round(columns / 2);
center_y = round(rows / 2);
mask((center_y - window_outer_size):(center_y + window_outer_size), (center_x - window_outer_size):(center_x + window_outer_size)) = 0;
mask((center_y - window_inner_size):(center_y + window_inner_size), (center_x - window_inner_size):(center_x + window_inner_size)) = 1;
img_if = img_if .* mask;

img_ifs = abs(img_if);                # Imagen con filtro pasa baja
img_it = uint8(real(ifft2(img_if)));  # Imagen en Dominio Espacial

subplot(1, 2, 1);
imshow(log(img_ifs + 1), []);

subplot(1, 2, 2);
imshow(img_it, []);
