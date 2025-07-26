function cropped_img = question_4(img_path, top_left, bottom_right)
  % question_4 - Crop an image using top-left and bottom-right coordinates
  %
  % Syntax:
  %   cropped_img = question_4('example.jpg', [50, 100], [200, 300])
  %
  % Inputs:
  %   img_path      - Path to the image file
  %   top_left      - [row, column] of top-left corner (y, x)
  %   bottom_right  - [row, column] of bottom-right corner (y, x)
  %
  % Output:
  %   cropped_img   - The cropped image matrix
  
  pkg load image  % Make sure the image package is loaded

  % Step 1: Read the image
  img = imread(img_path);
  
  % Step 2: Extract coordinates
  row1 = top_left(1);
  col1 = top_left(2);
  row2 = bottom_right(1);
  col2 = bottom_right(2);

  % Step 3: Validate dimensions
  [height, width, ~] = size(img);
  if row1 < 1 || row2 > height || col1 < 1 || col2 > width
    error('Crop region is outside the image bounds.');
  end
  if row2 <= row1 || col2 <= col1
    error('Invalid coordinates: bottom-right must be below and to the right of top-left.');
  end

  % Step 4: Perform cropping
  cropped_img = img(row1:row2, col1:col2, :);

  % Step 5: Display original and cropped images
  figure;
  subplot(1,2,1);
  imshow(img);
  title('Original Image');

  subplot(1,2,2);
  imshow(cropped_img);
  title('Cropped Image');

end
