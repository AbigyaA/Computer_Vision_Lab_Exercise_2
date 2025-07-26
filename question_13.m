function question_13(image_path)
  % question_13 - Convert image to grayscale and HSV
  %
  % Usage:
  %   question_13('Pink_Flower.png')

  img = imread(image_path);

  % Convert to grayscale
  gray = rgb2gray(img);

  % Convert to HSV
  hsv_img = rgb2hsv(img);

  % Edge detection on grayscale
  edges = edge(gray, 'sobel');

  % Thresholding (basic segmentation)
  seg = gray > 100;

  % Display
  figure;
  subplot(2,3,1); imshow(img); title('Original RGB');
  subplot(2,3,2); imshow(gray); title('Grayscale');
  subplot(2,3,3); imshow(hsv_img); title('HSV');
  subplot(2,3,4); imshow(edges); title('Edges (Sobel on Gray)');
  subplot(2,3,5); imshow(seg); title('Threshold Segmentation');
end
