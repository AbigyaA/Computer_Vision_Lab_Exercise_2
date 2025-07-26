function question_11(image_path, scale_factor, offset)
  % question_11 - Apply scaling and translation to pixel values
  %
  % Usage:
  %   question_11('Dog_1.png', 1.2, 30)

  img = imread(image_path);
  img_double = im2double(img);

  % Apply scaling and offset
  adjusted = img_double * scale_factor + offset/255;

  % Clip to [0, 1]
  adjusted = min(max(adjusted, 0), 1);

  % Display original and adjusted images
  figure;
  subplot(1,2,1);
  imshow(img);
  title('Original Image');

  subplot(1,2,2);
  imshow(adjusted);
  title(sprintf('Adjusted (Scale=%.2f, Offset=%d)', scale_factor, offset));
end
