ActiveAdmin.register Reveal do

  actions  :index, :destroy
  
  fields = [:email, :name, :created_at]

  fields.each do |field|
    filter field
  end

  index  do
    fields.each do |field|
      column field
    end

    column :StyleQuiz do |customer|
      a=Reveal.find(customer.id)
      #{customer.id} 
      unless a.nil?
        unless a.style_quiz.nil?
          e= a.style_quiz
          "#{e}"
          # "#{image_tag r.color_spectrum.url}"
        else
          'none'
        end
      else
       'none'
      end
    end

    column "Color" do |customer|
      a = Reveal.find(customer.id)
      unless a.nil?
        unless a.color_quiz.nil?
          r = a.color_quiz
          "#{r}"
        else
          'none'
        end
      else
        'none'
      end
    end

    default_actions
  end
  
end
