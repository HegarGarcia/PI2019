# Leer imagen
img = imread("lena.bmp");

# Imagen en double y escala de grises
img = double(rgb2gray(img));

# Aplicar FFT
img_if = fft2(img);

# Obtener Espectro de Amplitud
img_ea = abs(img_if);

figure;
subplot(1, 2, 1);
imshow(img_ea, []);

subplot(1, 2, 2);
imshow(log(img_ea + 1), []);

# imwrite(img_ea, './outputs/p1_espectro_amplitud.jpg');
# imwrite(log(img_ea + 1), './outputs/p1_espectro_amplitud_log.bmp');

# Espectro de Amplitud con FFTShift
img_eas = fftshift(img_ea);

figure;
subplot(1, 2, 1);
imshow(img_eas, []);

subplot(1, 2, 2);
imshow(log(img_eas + 1), []);

# imwrite(img_eas, './outputs/p1_espectro_amplitud_shift.jpg');
# imwrite(log(img_eas + 1), './outputs/p1_espectro_amplitud_shift_log.jpg');

# Invertir FFT
img_it = ifft2(img_if);
img_its = ifft2(fftshift(img_if));

figure;
subplot(1, 2, 1);
imshow(img_it, []);

subplot(1, 2, 2);
imshow(uint8(real(img_its)), []);

# imwrite(img_it, './outputs/p1_espectro_amplitud_inv.jpg');
# imwrite(uint8(real(img_its)), './outputs/p1_espectro_amplitud_inv_real.jpg');
