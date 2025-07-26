function rotated = question_6(img_path, angle_deg)
  % question_6 - Rotate an image by a given angle (in degrees)
  %
  % Usage:
  %   question_6('Cat_2.jpg', 45)

  pkg load image

  img = imread(img_path);

  % Rotate image using bicubic interpolation
  rotated = imrotate(img, angle_deg, 'bicubic', 'loose');  % 'loose' resizes canvas

  % Show results
  figure;
  subplot(1,2,1);
  imshow(img);
  title('Original Image');

  subplot(1,2,2);
  imshow(rotated);
  title(sprintf('Rotated Image (%d°)', angle_deg));
end
