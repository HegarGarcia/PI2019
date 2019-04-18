import cv2
from numpy import fft
from matplotlib import pyplot as plt


def band_filter(image_path, outer_window=20, inner_window=10):
    img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)

    img_if = fft.fft2(img)

    plt.imshow(fft.ifft2(img_if), cmap='gray')
    plt.show()


if __name__ == "__main__":
    band_filter("../../images/lena_gray.bmp")
