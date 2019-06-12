% 1. Mostrar imagen original
rgb = imread('images/coloredChips.png');
% figure, imshow(rgb);
 
% 2. Muestra una línea de medición
% d = imdistline;
 
% 3. Quita el línea de medición
% pause, delete(d);
 
% 4. Cambia la imagen de RGB a Escala de Gris
% gray_image = rgb2gray(rgb);
% imshow(gray_image), title('Escala de Grises');
 
% 5. Detecta los círculos en imagen y marca contornos a su alrededor
% centers -> Matrix con los centros de los círculos
% radii -> Radio aproximado de los círculos
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark');
figure, subplot(2, 4, 1);
imshow(rgb);
% title('OP: Dark');
viscircles(centers, radii);
 
% 6. Detecta los círculos en imagen y marca contornos a su alrededor
% Diferente sensibilidad
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.9);
subplot(2, 4, 2);
imshow(rgb);
% title('OP: Dark, Sensitivity: 0.9');
viscircles(centers, radii);
 
% 7. Detecta los círculos en imagen y marca contornos a su alrededor
% Diferente sensibilidad
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.92);
subplot(2, 4, 3);
imshow(rgb);
% title('OP: Dark, Sensitivity: 0.92');
viscircles(centers, radii);
 
% 8. Detecta los círculos en imagen y marca contornos a su alrededor
% Diferente sensibilidad y metodo de busqueda
[centers, radii] = imfindcircles(rgb,[20 25], 'ObjectPolarity','dark','Sensitivity',0.92,'Method','twostage');
subplot(2, 4, 4);
imshow(rgb);
% title('OP: Dark, Sensitivity: 0.92, Method: twostage');
viscircles(centers,radii);
 
% 9. Detecta los círculos en imagen y marca contornos a su alrededor
% Diferente sensibilidad y metodo de busqueda
[centers, radii] = imfindcircles(rgb,[20 25], 'ObjectPolarity','dark','Sensitivity',0.95,'Method','PhaseCode');
subplot(2, 4, 5);
imshow(rgb);
% title('OP: Dark, Sensitivity: 0.95, Method: PhaseCode');
viscircles(centers, radii);
 
% 10. Detecta los círculos en imagen y marca contornos a su alrededor
% Diferente sensibilidad y polaridad
[centersBright, radiiBright] = imfindcircles(rgb,[20 25],'ObjectPolarity','bright','Sensitivity',0.92);
subplot(2, 4, 6);
imshow(rgb);
% title('OP: Bright, Sensitivity: 0.92');
viscircles(centersBright, radiiBright,'EdgeColor','b');
 
% 11. Detecta los círculos en imagen y marca contornos a su alrededor
% Diferente sensibilidad, polaridad y límite de borde
[centersBright, radiiBright, metricBright] = imfindcircles(rgb,[20 25],'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
subplot(2, 4, 7);
imshow(rgb);
% title('OP: Bright, Sensitivity: 0.92, ET: 0.1');
viscircles(centersBright, radiiBright,'EdgeColor','b');
 
% 11. Detecta los círculos en imagen y marca contornos a su alrededor
% Diferente sensibilidad y límite de borde
[centersDark, radiiDark, metricDark] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.92,'EdgeThreshold',0.1);
subplot(2, 4, 8);
imshow(rgb);
% title('OP: Dark, Sensitivity: 0.92, ET: 0.1');
viscircles(centersBright, radiiBright,'EdgeColor','b');