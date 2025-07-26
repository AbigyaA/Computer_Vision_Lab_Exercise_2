function question_7(url, save_as)
  % question_7 - Download image from URL and display it
  %
  % Usage:
  %   question_7('https://images.pexels.com/test.jpeg', 'test.jpeg')

  try
    % Step 1: Download image using urlwrite (old-style but reliable)
    urlwrite(url, save_as);
    fprintf('Image successfully downloaded to %s\n', save_as);

    % Step 2: Read the image
    img = imread(save_as);

    % Step 3: Display the image
    figure;
    imshow(img);
    title('Downloaded Image');
  catch err
    fprintf('Error: %s\n', err.message);
  end
end
