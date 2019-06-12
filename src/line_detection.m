function [processed] = line_detection(image, kernel)
    if size(image, 3) > 1
        image = rgb2gray(image);
    end
    
    image = imbinarize(image, 0.20);
    [~,threshold] = edge(image, 'sobel');
    image = edge(image,'sobel', threshold * 0.5);

    imshow(image);
    
    threshold = max(kernel, [], 'all');
    processed = zeros(size(kernel, 1), size(kernel, 2), 'uint8');
    padding_size_y = floor(size(kernel, 1) / 2);
    padding_size_x = floor(size(kernel, 2) / 2);
    image = padarray(image, [padding_size_y, padding_size_x], 0, 'both');
    
    for y = (padding_size_y + 1):(size(image, 1) - padding_size_y)
        for x = (padding_size_x + 1):(size(image, 2) - padding_size_x)
            y_range = (y - padding_size_y):(y + padding_size_y);
            x_range = (x - padding_size_x):(x + padding_size_x);
            
            mask = image(y_range, x_range) .* kernel;
            mask(mask < 0) = 0;
            
            processed(y - padding_size_y, x - padding_size_x) = sum(mask, 'all');
        end 
    end
    
    processed(processed <= threshold) = 0;
    processed(processed > threshold) = 1;
    processed = logical(processed);
end

