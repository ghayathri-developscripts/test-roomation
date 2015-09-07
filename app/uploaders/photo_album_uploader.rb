# encoding: utf-8

class PhotoAlbumUploader < CarrierWave::Uploader::Base

    include CarrierWave::RMagick

  THUMB_SIZE = 200;
  SMALL_THUMB_SIZE = 300;

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [450, 275]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [200, 200]
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
