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
window_size = input("Tamaño de ventana: ");

# Aplicar FFTShift
img_if = fftshift(img_if);

# Aplicar ventana a imagen
img_if(1:window_size, 1:window_size) = 0;
img_if(1:window_size, columns - (window_size - 1):columns) = 0;
img_if(rows - (window_size - 1 ):rows, 1:window_size) = 0;
img_if(rows - (window_size -1 ):rows, columns - (window_size - 1):columns) = 0;

img_ifs = fftshift(abs(img_if));                # Imagen con filtro pasa baja
img_it = uint8(real(ifft2(fftshift(img_if))));  # Imagen en Dominio Espacial
  
figure;
subplot(1, 2, 1);
imshow(log(img_ifs + 1), []);

subplot(1, 2, 2);
imshow(img_it, []);

imwrite(log(img_ifs + 1), strcat("./outputs/", "p3_filtro_pasa_baja_ventana_", num2str(window_size), ".jpg"));
imwrite(img_it, strcat("./outputs/", "p3_dominio_espacial_ventana_", num2str(window_size), ".jpg"));