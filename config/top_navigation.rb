SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'b-top-navigation nav'
    if params[:action] == "show" && params[:controller] == "galleries"
      primary.item :gallery,       'Gallery',       show_path(@gallery),                 :class => 'b-menu-item b-first-item'
    else
       primary.item :gallery,       'Gallery',       gallery_path,                 :class => 'b-menu-item b-first-item'
    end
    primary.item :about,         'About',         about_us_path,                :class => 'b-menu-item'
    primary.item :pricing,       'Pricing',       pricing_path,                 :class => 'b-menu-item'
    primary.item :crib_sheets,   'Crib Sheets',   'http://blog.roomations.com', :class => 'b-menu-item'
    primary.item :for_designers, 'For Designers', invite_requests_path,           :class => 'b-menu-item'
    primary.item :buzz,          'Buzz',          'http://blog.roomations.com/p/press.html',    :class => 'b-menu-item b-last-item'
  end
end
