function [processed] = ofilter(image, reference)
    image = rgb2gray(image);
    reference = rgb2gray(reference);
    
    image_fft = fft2(image);
    ref_fft = fft2(reference);
    
    ref_conj = conj(ref_fft);
    
    filter = ref_conj ./ (abs(image_fft) .^ 2 + abs(ref_fft) .^ 2);
    
    processed = abs(real(fftshift(ifft2(image_fft .* filter))));
end

