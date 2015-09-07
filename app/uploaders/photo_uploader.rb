class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  THUMB_SIZE = 200;
  SMALL_THUMB_SIZE = 100;

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [THUMB_SIZE, THUMB_SIZE]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [SMALL_THUMB_SIZE, SMALL_THUMB_SIZE]
  end

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end