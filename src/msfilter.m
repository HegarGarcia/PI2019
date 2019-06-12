function [processed] =  msfilter(image, reference)
    image = rgb2gray(image);
    reference = rgb2gray(reference);

    image_fft = fft2(image);
    ref_fft = fft2(reference);

    filter = conj(ref_fft);

    processed = abs(real(fftshift(ifft2(image_fft .* filter))));
end

