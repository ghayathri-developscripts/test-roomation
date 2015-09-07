ActiveAdmin.register Discount do
  
  index do
    column :name do |discount|discount.name
      display_name = discount.name.present? ? discount.name : "##{discount.id}"
      link_to "#{display_name}", admin_discount_path(discount)
    end

    column :amount do |discount|
      case discount.discount_type
      when Discount::TYPE_DOLLARS
        number_to_currency discount.amount
      when Discount::TYPE_PERCENT
        number_to_percentage discount.amount, precision: 0
      end
    end

    column :code, sortable: false
    column :start_date
    column :expiration_date
    column :package, sortable: false
    default_actions
  end

  form partial: "form"

end
