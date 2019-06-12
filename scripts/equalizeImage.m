function [out] = equalizeimage(img, colorspace = 'rgb', layerRange = 1)

  # Volver nombre de espacio de color en minusculas
  colorspace = lower(colorspace);

  # Transformar imagen a nuevo espacio de color
  out = changecolorspace(img, 'rgb', colorspace);

  # Obtener tamaño de image y cantidad de pixeles
  [x, y, z] = size(img);
  pixel_count = x * y;
  
  # Ciclo por cada capa de la imagen
  for layerNumber = layerRange

    # Obtener la capa
    layer = out(:, :, layerNumber);
    
    # Crear histograma de la capa
    [ frequency ] = imhist(layer);

    # Crear tabla lookup 
    lut = round((cumsum(frequency) / pixel_count) * 256);

    # Pasar la capa a través de tabla lookup
    out(:, :, layerNumber) = intlut(uint8(layer), uint8(lut));
  end
  
  # Regresar imagen a rgb
  out = changecolorspace(out, colorspace, 'rgb');

end
