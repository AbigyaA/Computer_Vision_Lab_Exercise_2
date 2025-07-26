% Demonstrates different grayscale conversion techniques in Octave

pkg load image  % Load the image package if needed

% Step 1: Read the color image
img = imread('Cat_1.jpg');

% Step 2: Separate R, G, B channels
R = double(img(:, :, 1));
G = double(img(:, :, 2));
B = double(img(:, :, 3));

% Step 3: Convert using different methods

% 1. Average Method
gray_avg = uint8((R + G + B) / 3);

% 2. Luminosity Method (weighted)
gray_lum = uint8(0.21 * R + 0.72 * G + 0.07 * B);

% 3. Desaturation Method (average of max and min of RGB)
gray_desat = uint8((max(max(R, G), B) + min(min(R, G), B)) / 2);

% Step 4: Display results
figure;
subplot(2,2,1);
imshow(img);
title('Original Color Image');

subplot(2,2,2);
imshow(gray_avg);
title('Grayscale - Average');

subplot(2,2,3);
imshow(gray_lum);
title('Grayscale - Luminosity');

subplot(2,2,4);
imshow(gray_desat);
title('Grayscale - Desaturation');
