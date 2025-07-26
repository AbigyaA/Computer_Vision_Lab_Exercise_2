function question_10(image_path)
  % question_10 - Basic metadata extraction for an image
  %
  % Usage:
  %   question_10('Cat_1.jpg')

  info = imfinfo(image_path);

  fprintf('File Name       : %s\n', info.Filename);
  fprintf('Format          : %s\n', info.Format);
  fprintf('Resolution      : %dx%d\n', info.Width, info.Height);
  fprintf('Color Type      : %s\n', info.ColorType);
  if isfield(info, 'FileModDate')
    fprintf('Modified Date   : %s\n', info.FileModDate);
  end

  % Display image
  img = imread(image_path);
  figure;
  imshow(img);
  title('Loaded Image');
end
