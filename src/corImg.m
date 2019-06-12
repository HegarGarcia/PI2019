function [processed] = corImg(image, reference)
    image = rgb2gray(image);
    reference = rgb2gray(reference);
    
    image = imcomplement(image);
    reference = imcomplement(reference);
    
    image_fft = fft2(image);
    ref_fft = fft2(reference);
    
    ref_conj = conj(ref_fft);
    
    processed = real(fftshift(ifft2(image_fft .* ref_conj)));
end
