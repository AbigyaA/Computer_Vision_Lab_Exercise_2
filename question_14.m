function question_14(image_path)
  % question_14 - Apply histogram equalization and contrast stretching
  %
  % Usage:
  %   question_14('Pink_Flower.png')

  img = imread(image_path);
  gray = rgb2gray(img);

  % Histogram Equalization
  equalized = histeq(gray);

  % Contrast Stretching
  min_val = double(min(gray(:)));
  max_val = double(max(gray(:)));
  stretched = im2uint8((double(gray) - min_val) / (max_val - min_val));

  % Display
  figure;
  subplot(1,3,1); imshow(gray); title('Original Grayscale');
  subplot(1,3,2); imshow(equalized); title('Histogram Equalized');
  subplot(1,3,3); imshow(stretched); title('Contrast Stretched');
end
