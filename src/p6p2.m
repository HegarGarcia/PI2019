close all;
clear all;

% Leer imagen
I= imread('lena.bmp');
[rows, columns, depth] = size(I);

% Si es a color reducirla a escala de grises
if depth > 1
  I=rgb2gray(I);
end

% Mostrar imagen original
figure, imshow(I);
I = double(I);

% Crear y aplicar filtro de movimiento
PSF = fspecial('motion', 40, 45);
ID = imfilter(I, PSF, 'conv', 'circular');
figure, imshow(ID), title('Imagen degradada por movimiento')

% Aplicar ruido gaussiano
MR= 0;
VR = 0.01;
IDR = imnoise(ID, 'gaussian', MR,VR);
figure, imshow(IDR), title('Imagen degradada por Mov y Ruido Aditivo')

% Estimacion de varianza de ruido
Est_Ruido = VR/var(I(:));

% Invertir filtro de movimiento con varianza de ruido
IrFW = deconvwnr(IDR, PSF, Est_Ruido);
figure, imshow(IrFW)
title('Restauración de Imagen aplicando estimación de ruido');