function question_12(image_path)
  % question_12 - Show image at original and lower resolutions
  %
  % Usage:
  %   question_12('Dog_1.png')

  img = imread(image_path);

  % Downscale to simulate low resolution
  low_res = imresize(img, 0.25);  % 25% size
  upscaled = imresize(low_res, size(img)(1:2));

  figure;
  subplot(1,3,1);
  imshow(img);
  title('Original');

  subplot(1,3,2);
  imshow(low_res);
  title('Low Resolution');

  subplot(1,3,3);
  imshow(upscaled);
  title('Upscaled from Low Res');

  fprintf('Original size: %dx%d\n', size(img,1), size(img,2));
  fprintf('Low res size : %dx%d\n', size(low_res,1), size(low_res,2));
end
