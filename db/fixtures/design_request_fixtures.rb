StylePoll.seed(:id) do |sp|
  sp.id = 1
  sp.question_ids = Question.all.group_by(&:group_id).map {|group, questions| questions.first.id}
  sp.user_id = 1
end

design_request_params = {
  :user_id  => 1,
  :package_id => Package.first,
  :budget_explanation  => "large budget",
  :other_wishes => "other wishes",
  :budget_type_id      => BudgetType.first,
  :life_phase_id       => LifePhase.first,
  :project_approach_id => ProjectApproach.first,
  :style_poll_id       => 1
}

1.upto(5) do |index|
  Project.seed(:id) do |proj|
    proj.id = index
    proj.design_request_id = index
    proj.user_id = 3
  end
  DesignRequest.seed(:id, [
    { :id => index }.merge(design_request_params)
  ])

  Room.seed(:id, [
    {
      :id                => index,
      :design_request_id => index,
      :room_size         => "W:10 H:10 D:10",
      :title             => "my room",
      :windows           => "i have large windows",
      :rejected_colors   => "red green blue",
      :custom_shops      => "saghdasgjs",
      :color_set_id      => ColorSet.first,
      :fabric_id         => Fabric.first,
      :wood_type_id      => WoodType.first,
    }
  ])

end