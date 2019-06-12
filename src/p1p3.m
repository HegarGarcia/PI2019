I = imread('./images/cell.tif');
% figure, imshow(I), title('Imagen original de célula');

% Se extraen los bordes
[BW, threshold] = edge(I, 'sobel'); 
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('Extracting edges');
 
% Se rellenan las estructuras
se90 = strel('diamond', 3)
BWsdil = imdilate(BWs, se90);
figure, imshow(BWsdil), title('Filling structures');

% Rellanando los huecos faltantes
BWdfill = imfill(BWsdil, 'holes');
figure, imshow(BWdfill), title('Filling missing holes');
 
% Eliminacion de estructuras cerca de bordes
BWnobord = imclearborder(BWdfill, 4);
figure, imshow(BWnobord), title('Celula');
 
% Erosion para delimitacion de bordes
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
figure, imshow(BWfinal), title('Erosion para delimitacion de borde');
 
% Delimitacion de bordes en imagen
BWoutline = bwperim(BWfinal);
Segout = I;
Segout(BWoutline) = 255;
figure, imshow(Segout), title('Delimitación de borde');