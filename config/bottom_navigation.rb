SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'b-bottom-navigation nav'

    primary.item :faq,     'FAQ',           faq_path,     :class => 'b-menu-item b-first-item'
    primary.item :press,   'Press',         'http://blog.roomations.com/p/press.html',:class => 'b-menu-item'
    primary.item :policy,  'Privacy Policy', policy_path, :class => 'b-menu-item b-last-item terms-window'
  end
end
