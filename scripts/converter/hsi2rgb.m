function [imRGB] = hsi2rgb(imHSI)
% ------------------------------------------------------------------------
% HSI2RGB Converts Hue/Saturation/Intensity (HSI) matrix to Red/Green/Blue
%         colour space. Output is returned as an MxNx3 matrix of type
%         uint8, where each plane is the Red, Green, and Blue values
%         respectively.
%
%                       Last Revision: 2014-04-21
%
% Syntax: [imRGB] = hsi2rgb(imHSI)
%
% Inputs: 
%   imHSI - MxNx3 double matrix, whose planes are the hue angle (degrees),
%           saturation, and intensity values respectively.
%
% Outputs:
%   imRGB - MxNx3 uint8 matrix, whose planes are the red, green, and blue
%           values respectively. 
% ------------------------------------------------------------------------

% Input Checking ---------------------------------------------------------
[rows, columns, planes] = size(imHSI);

if planes ~= 3
	error(['Image is not encoded with HSI values. '...
	       'HSI image matrix must be MxNx3 in size.'])
end

% Initialize RGB variables -----------------------------------------------
R = zeros(rows,columns);
G = zeros(rows,columns);
B = zeros(rows,columns);

% For readability, HSI values are divided into separate matrices.
H = imHSI(:,:,1);
S = imHSI(:,:,2);
I = imHSI(:,:,3);

% If Hue Angle is less than 120 degrees ----------------------------------
index = find( (H >= 0) & (H < 120) );

B(index) = I(index).*(1 - S(index));

num = S(index).*cosd(H(index));
den = cosd(60 - H(index));
R(index) = I(index).*(1 + num./den);

G(index) = 3.*I(index) - (R(index) + B(index));

% If Hue Angle is between 120 and 240 degrees ----------------------------
index = find( (H >= 120) & (H < 240) );

H(index) = H(index) - 120;

R(index) = I(index).*(1 - S(index));

num = S(index).*cosd(H(index));
den = cosd(60 - H(index));
G(index) = I(index).*(1 + num./den);

B(index) = 3.*I(index) - (R(index) + G(index));

% If Hue Angle is greater than 240 degrees -------------------------------
index = find( (H >= 240) & (H < 360) );

H(index) = H(index) - 240;

G(index) = I(index).*(1 - S(index));

num = S(index).*cosd(H(index));
den = cosd(60 - H(index));
B(index) = I(index).*(1 + num./den);

R(index) = 3.*I(index) - (B(index) + G(index));

% Return the results as one variable -------------------------------------
imRGB = zeros(rows,columns,planes);
imRGB(:,:,1) = R;
imRGB(:,:,2) = G;
imRGB(:,:,3) = B;

imRGB = cast(imRGB, 'uint8');

end