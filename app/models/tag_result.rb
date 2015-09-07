class TagResult
  include Comparable

  attr_accessor :tag_id, :count

  def initialize(a_tag_id, a_count)
    @tag_id = a_tag_id
    @count = a_count
  end

  def <=>(other)
    self.count <=> other.count
  end
end