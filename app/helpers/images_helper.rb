module ImagesHelper

  def photo_main_in_album?(photo, album)
    photo.present? and album.present? and album.main_photo_id.present? && (album.main_photo_id == photo.id)
  end
end
