module LayoutHelper
  def page_dom_class
    "#{controller_path.gsub('/', '-')} #{action_name}"
  end

  def page_title
    'Roomations'
  end
  def face_title
    @face_title
  end
  def face_desc
    @face_desc
  end
  def face_img
    @face_img
  end
  def face_url
    @face_url
  end

end