pkg load image

img = imread('Cat_2.jpg');

% Convert to grayscale
gray = rgb2gray(img);

% Convert to HSV
hsv_img = rgb2hsv(img);

% Convert back to RGB from HSV (for visualization)
hsv_rgb = hsv2rgb(hsv_img);

% Display all
figure;
subplot(2,2,1); imshow(img); title('Original RGB');
subplot(2,2,2); imshow(gray); title('Grayscale');
subplot(2,2,3); imshow(hsv_rgb); title('HSV -> RGB');

% Simulated CMYK (not true CMYK, but illustrative)
C = 255 - double(img(:,:,1));
M = 255 - double(img(:,:,2));
Y = 255 - double(img(:,:,3));
K = min(cat(3, C, M, Y), [], 3);

CMY = uint8(cat(3, C, M, Y));
figure;
imshow(CMY); title('Simulated CMY View');
