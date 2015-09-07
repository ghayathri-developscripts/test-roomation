class StylePoll < ActiveRecord::Base
  STYLE_RESULT = { "Country+Traditional" => "Hand-Crafted Comfort", "Country+Modern" => "Everyday Natural", "Urban+Traditional" => "Tailored Classic", "Urban+Modern" => "Spirited Vogue" }
  belongs_to :user
  has_many :design_requests
  has_many :poll_questions
  has_many :questions, :through => :poll_questions
  belongs_to :style_quiz_result
  belongs_to :color_quiz_result

  validate :all_questions_answered?
  
  def all_questions_answered?
    unless questions.size == Question.count(:group_id, :distinct => :group_id)
      errors.add(:base, "Please answer all questions")
    end
  end

  def array_of_results(tags)
    results = []
    tags.each do |tag|
      count = 0
      questions.each do |question|
        count += 1 if question.tags.include? tag
      end
      results << TagResult.new(tag.id, count)
    end
    results.sort{ |x,y| y <=> x }
  end

  def get_tag_result_count(results, name)
    results.each do |res|
      tag = Tag.find_by_id(res.tag_id)
      if tag.present? && tag.name == name
        return res.count
      end
    end
  end

  def style_result
    return nil unless valid?
    style_results = array_of_results StyleTag.all
    country = get_tag_result_count(style_results, "Country")
    traditional = get_tag_result_count(style_results, "Traditional")
    modern = get_tag_result_count(style_results, "Modern")
    urban = get_tag_result_count(style_results, "Urban")

    if country >= urban
      if traditional >= modern
        result_name = STYLE_RESULT["Country+Traditional"]
      else
        result_name = STYLE_RESULT["Country+Modern"]
      end
    else
      if traditional >= modern
        result_name = STYLE_RESULT["Urban+Traditional"]
      else
        result_name = STYLE_RESULT["Urban+Modern"]
      end
    end

    StyleQuizResult.find_by_name(result_name)
  end

  def color_result
    return nil unless valid?
    color_results = array_of_results ColorTag.all
    result_name = Tag.find(color_results.first.tag_id).name
    ColorQuizResult.find_by_name(result_name)
  end

  def init_results_associations
    sr = self.style_result
    cr = self.color_result
    if sr.present? and cr.present?
      self.style_quiz_result = sr
      self.color_quiz_result = cr
      return true
    end
    return false
  end
end
# == Schema Information
#
# Table name: style_polls
#
#  id                   :integer         not null, primary key
#  user_id              :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  style_quiz_result_id :integer
#  color_quiz_result_id :integer
#

