module PunctuationHelper
  def hlaquo
    content_tag :span, '&laquo;'.html_safe, :class => 'hlaquo'
  end
end