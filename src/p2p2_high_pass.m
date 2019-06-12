# Leer imagen
img = imread("images/lena.bmp");

# Imagen en double y escala de grises
img = double(rgb2gray(img));

# Aplicar FFT
img_if = fft2(img);

[rows, columns] = size(img_if);

# Obtener tamaño de ventana
window_size = input("Tamaño de ventana: ");

# Aplicar ventana a imagen
img_if(1:window_size, 1:window_size) = 0;
img_if(1:window_size, columns - (window_size - 1):columns) = 0;
img_if(rows - (window_size -1 ):rows, 1:window_size) = 0;
img_if(rows - (window_size -1 ):rows, columns - (window_size - 1):columns) = 0;

img_ifs = fftshift(abs(img_if));      # Imagen con filtro pasa alta
img_it = uint8(real(ifft2(img_if)));  # Imagen en Dominio Espacial
img_itu = img_it;                     # Imagen en Dominio Espacial con Umbral

# Aplicar umbral
umbral = input("Umbral: ");

for i = 1:(rows * columns)
  if img_itu(i) > umbral
    img_itu(i) = 255;
  else
    img_itu(i) = 0;
  endif
endfor
  
figure;
##subplot(1, 3, 1);
imshow(log(img_ifs + 1), []);

##subplot(1, 3, 2);
##imshow(img_it, []);
##
##subplot(1, 3, 3);
##imshow(img_itu, []);

imwrite(log(img_ifs + 1), strcat("./outputs/", "p2_filtro_pasa_alta_ventana_", num2str(window_size), ".jpg"));
imwrite(img_it, strcat("./outputs/", "p2_dominio_espacial_ventana_", num2str(window_size), ".jpg"));
imwrite(img_itu, strcat("./outputs/", "p2_dominio_espacial_ventana", num2str(window_size), "_umbral_", num2str(umbral), ".jpg"));
