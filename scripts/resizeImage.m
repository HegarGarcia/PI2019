function [out] = resizeimage(img, ratio = 1, layersRange = 1, colorspace = 'rgb') 
  
  out = changecolorspace(img, 'rgb', colorspace);
  
  original_rows = size(out, 1);
  original_cols = size(out, 2);
  
  resized_rows = original_rows * ratio;
  resized_cols = original_cols * ratio;
  
  compressed_layer = compress(out, [resized_rows, resized_cols], layersRange); 
  decompressed_layer = compress(compressed_layer, [original_rows, original_cols], layersRange);
  
  for layerId = layersRange
    out(:, :, layerId) = decompressed_layer(:, :, layerId);
  end
  
  out = changeColorspace(out, colorspace, 'rgb');
end

function [out] = compressimage(img, sizes, layersRange)
  
  original_rows = size(img, 1);
  original_cols = size(img, 2);
  
  row_ratio = sizes(1) / original_rows;
  col_ratio = sizes(2) / original_cols;
  
  row_range = 1:(original_rows * row_ratio);
  col_range = 1:(original_cols * col_ratio);
  
  int_rows = ceil(row_range./row_ratio);
  int_cols = ceil(col_range./col_ratio);
  
  for layerId = layersRange
    layer = img(:, :, layerId);
    layer = layer(int_rows, :);
    out(:, :, layerId) = layer(:, int_cols);
  end
  
end
