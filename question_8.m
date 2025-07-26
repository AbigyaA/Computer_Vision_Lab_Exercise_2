function question_8(filename, brightness, contrast)
  % question_8 - Capture image from webcam and adjust brightness/contrast
  %
  % Usage:
  %   question_8('photo.jpg', 40, 1.5)
  %
  % Inputs:
  %   filename   - name to save the captured image (e.g., 'out.jpg')
  %   brightness - value to increase brightness (0–100), 0 = no change
  %   contrast   - multiplier for contrast (e.g., 1.0 = no change, 1.5 = higher)

  % Step 1: Capture image using ffmpeg (external command)
  fprintf('Capturing image from webcam...\n');
  status = system(sprintf('ffmpeg -f v4l2 -video_size 640x480 -i /dev/video0 -frames 1 %s -y -loglevel quiet', filename));

  if status != 0
    error('Failed to capture image. Make sure ffmpeg is installed and /dev/video0 is correct.');
  end

  % Step 2: Read captured image
  img = imread(filename);

  % Step 3: Adjust brightness and contrast
  % Convert to double for pixel manipulation
  img_double = im2double(img);

  % Apply brightness and contrast
  img_adjusted = img_double * contrast + brightness/255;

  % Clip values to [0, 1]
  img_adjusted = min(max(img_adjusted, 0), 1);

  % Step 4: Display original and adjusted images
  figure;
  subplot(1,2,1);
  imshow(img);
  title('Original Captured Image');

  subplot(1,2,2);
  imshow(img_adjusted);
  title(sprintf('Adjusted (Brightness=%d, Contrast=%.2f)', brightness, contrast));

  % Step 5: Save the adjusted image if needed
  imwrite(img_adjusted, ['adjusted_' filename]);
  fprintf('Saved adjusted image as adjusted_%s\n', filename);
end
