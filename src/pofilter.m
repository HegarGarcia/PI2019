function [processed] = pofilter(image, reference)
    image = rgb2gray(image);
    reference = rgb2gray(reference);
    
    image_fft = fft2(image);
    ref_fft = fft2(reference);
    
    ref_conj = conj(ref_fft);
    filter = ref_conj ./ abs(ref_fft);
    
    processed = abs(real(fftshift(ifft2(image_fft .* filter))));
end