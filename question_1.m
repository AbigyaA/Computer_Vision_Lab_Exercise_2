function question_1(folder_path)
  % Function to import and display images from a folder with different colormaps
  % folder_path: path to the directory containing the images
  
  % List all image files
  image_extensions = {'*.png', '*.jpg', '*.jpeg', '*.bmp'};
  image_files = [];

  % Collect all image files matching the formats
  for i = 1:length(image_extensions)
    files = dir(fullfile(folder_path, image_extensions{i}));
    image_files = [image_files; files];
  end

  % Check if any images found
  if isempty(image_files)
    disp('No images found in the specified directory.');
    return;
  end

  % Colormaps to apply
  colormaps = {'gray', 'hot', 'jet'};

  % Loop through each image
  for i = 1:length(image_files)
    file_name = image_files(i).name;
    full_path = fullfile(folder_path, file_name);
    
    try
      img = imread(full_path);
    catch err
      fprintf('Error reading file %s: %s\n', file_name, err.message);
      continue;
    end

    % If image is RGB, convert to grayscale for colormaps
    if size(img, 3) == 3
      img = rgb2gray(img);
    end

    % Display with different colormaps
    for j = 1:length(colormaps)
      figure;
      imagesc(img);
      colormap(colormaps{j});
      colorbar;
      title(sprintf('File: %s | Colormap: %s', file_name, colormaps{j}));
    end
  end
end
