close all;
clear all;

% Leer la imagen
img = imread('lena.bmp');
[rows, columns,  depth] = size(img);

% Si es a color reducirla a escala de grises
if  depth > 1
  img = rgb2gray(img);
end

% Mostrar imagen original
%figure, imshow(img), title('Imagen Original');
img = double(img);

dimension = 1024;
img_fft = fftshift(fft2(img, dimension, dimension));
%Ie = ifft2(img_fft, dimension, dimension);

% Considerar Fmax = 1
Fmin = 0.2;
Fmax = 0.5;

% Generar máscara circular rechaza banda
[f1,f2] = freqspace_poly(dimension);
[f1, f2] = meshgrid(f1, f2);
Hd = ones(dimension);
rad = sqrt(f1.^2 + f2.^2);
Hd((rad < Fmax) & (rad > Fmin)) = 0;

% Mostrar máscara rechaza banda
figure, mesh(f1(1:10:end, 1:10:end), f2(1:10:end, 1:10:end), Hd(1:10:end, 1:10:end)), title('Máscara Rechaza Banda');

% Aplicar máscara
Idpb = img_fft .* Hd;

% Imagen con filtro rechaza banda con tamaño 1024x1024
Ied = real(ifft2(fftshift(Idpb), dimension, dimension));
figure, imshow(Ied,[]), title('Imágen con Filtro Rechaza Banda en el dominio del espacio (Tamaño 1024x1024)');

% Imagen con filtro rechaza baja con tamaño original
Iedf = Ied(1:rows, 1:columns);
figure, imshow(Iedf,[]), title('Imágen con Filtro Rechaza Banda en el dominio del espacio (Tamaño original)');

% Generar máscara circular pasa banda
[f1,f2] = freqspace_poly(dimension);
[f1, f2] = meshgrid(f1, f2);
Hd = zeros(dimension);
rad = sqrt(f1.^2 + f2.^2);
Hd((rad<Fmax) & (rad>Fmin)) = 1;

% Mostrar máscara pasa banda
figure, mesh(f1(1:10:end, 1:10:end), f2(1:10:end, 1:10:end), Hd(1:10:end, 1:10:end)), title('Máscara Pasa Banda');

% Aplicar máscara
Idpb = img_fft.*Hd;

% Imagen con filtro pasa banda con tamaño 1024x1024
Ied = real(ifft2(fftshift(Idpb), dimension, dimension));
figure, imshow(Ied,[]), title('Imágen con Filtro Pasa Banda en el dominio del espacio (Tamaño 1024x1024)');

% Imagen con filtro pasa banda con tamaño original
Iedf = Ied(1:rows,1:columns);
figure, imshow(Iedf,[]), title('Imágen con Filtro Pasa Banda en el dominio del espacio (Tamaño original)');
