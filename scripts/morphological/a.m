clear all;
close all;

img_gray = imread('../../images/cameraman.jpeg');
img_bw = im2bw(img_gray);

struct = [0 1 0; 1 1 1; 0 1 0];

##figure, imshow(img_gray);
##figure, imshow(img_bw);

##eroded = erode(img_gray, struct);
##figure, imshow(eroded);

##eroded = logical(erode(img_bw, struct));
##figure, imshow(eroded);


##dilatated = dilatate(img_gray, struct);
##figure, imshow(dilatated);
##
##dilatated = logical(dilatate(img_bw, struct));
##figure, imshow(dilatated);


dilatated = logical(skeletonization(img_bw));
figure, imshow(dilatated);