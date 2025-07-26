% Script to resize an image to given dimensions while maintaining aspect ratio

% Clear workspace and figures
clear;
close all;
clc;

% Step 1: Load the image
original_img = imread('Cat_1.jpg');
[original_height, original_width, ~] = size(original_img);

% Display original image
figure;
imshow(original_img);
title(sprintf('Original Image - %dx%d', original_width, original_height));

% Step 2: Set the target size (max width and height)
target_width = 300;   % You can change this value
target_height = 300;

% Step 3: Compute the scaling factor to maintain aspect ratio
scale_width = target_width / original_width;
scale_height = target_height / original_height;

% Use the smaller scale to maintain aspect ratio
scale = min(scale_width, scale_height);

% Step 4: Calculate new dimensions
new_width = round(original_width * scale);
new_height = round(original_height * scale);

% Step 5: Resize the image
resized_img = imresize(original_img, [new_height, new_width]);

% Step 6: Display resized image
figure;
imshow(resized_img);
title(sprintf('Resized Image - %dx%d (Maintaining Aspect Ratio)', new_width, new_height));

% Step 7: Compare quality visually
% Optionally save resized image for further comparison
imwrite(resized_img, 'resized_output.jpg');

% Step 8: Display both images side by side
figure;
subplot(1,2,1);
imshow(original_img);
title('Original Image');

subplot(1,2,2);
imshow(resized_img);
title('Resized Image');
