% Resize an image using different interpolation methods and compare results

pkg load image  % Load image package

% Step 1: Load the original image
img = imread('Cat_2.jpg');

% Resize target size
scale = 2.0;  % Scale up (change to <1.0 to scale down)
target_size = round(scale * size(img)(1:2));

% Step 2: Resize using Nearest Neighbor
tic;
img_nearest = imresize(img, target_size, 'nearest');
time_nearest = toc;

% Step 3: Resize using Bilinear
tic;
img_bilinear = imresize(img, target_size, 'bilinear');
time_bilinear = toc;

% Step 4: Resize using Bicubic
tic;
img_bicubic = imresize(img, target_size, 'bicubic');
time_bicubic = toc;

% Step 5: Display results
figure;

subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imshow(img_nearest);
title(sprintf('Nearest Neighbor (%.4f sec)', time_nearest));

subplot(2,2,3);
imshow(img_bilinear);
title(sprintf('Bilinear (%.4f sec)', time_bilinear));

subplot(2,2,4);
imshow(img_bicubic);
title(sprintf('Bicubic (%.4f sec)', time_bicubic));
