Role.seed(:id, [
  { :id => 1, :name => "user" },
  { :id => 2, :name => "admin" },
  { :id => 3, :name => "designer" }
])

User.seed(:id, [
  { :id => 1,
    :first_name => "First Name",
    :last_name => "Last Name",
    :email => "user@roomations.com",
    :role_id => 1,
    :password => "123456"
  },
  { :id => 2,
    :first_name => "First Name",
    :last_name => "Last Name",
    :email => "admin@roomations.com",
    :role_id => 2,
    :password => "123456"
  },
  { :id => 3,
    :first_name => "Design",
    :last_name => "Diva",
    :email => "designer@roomations.com",
    :role_id => 3,
    :password => "123456",
    :is_active => true,
    :avatar  => File.open(File.join(Rails.root, "db/fixtures/assets/images/designer1.png"))
  },
  { :id => 4,
    :first_name => "Green",
    :last_name => "Machine",
    :email => "designer1@roomations.com",
    :role_id => 3,
    :password => "123456",
    :is_active => true,
    :avatar  => File.open(File.join(Rails.root, "db/fixtures/assets/images/designer2.png"))
  },
  { :id => 5,
    :first_name => "Urban",
    :last_name => "Dude",
    :email => "designer2@roomations.com",
    :role_id => 3,
    :password => "123456",
    :is_active => true,
    :avatar  => File.open(File.join(Rails.root, "db/fixtures/assets/images/designer3.png"))
  }
])

Package.seed(:id, [
  { :id => 1, :title => 'Design Advice', :price_cents => 2000, :code => 'design-advice', :benefits => '1 Month of advice' },
  { :id => 2, :title => 'One board', :price_cents => 25000, :code => 'one-board', :benefits => "1 Styleboard\n 3 Months of advice" },
  { :id => 3, :title => 'Two boards', :price_cents => 30000, :code => 'two-boards', :benefits => "2 Styleboards\n 3 Months of advice" },
  { :id => 4, :title => 'Three boards', :price_cents => 35000, :code => 'three-boards', :benefits => "3 Styleboards\n 3 Months of advice" },
  { :id => 5, :title => 'One design', :price_cents => 40000, :code => 'one-design', :benefits => "1 Design\n 1 Styleboards\n 3 Months of advice\n 1 Shopping list" },
  { :id => 6, :title => 'Two designs', :price_cents => 48000, :code => 'two-designs', :benefits => "2 Designs\n 2 Styleboards\n 3 Months of advice\n 1 Shopping list" },
  { :id => 7, :title => 'Three designs', :price_cents => 54000, :code => 'three-designs', :benefits => "3 Designs\n 3 Styleboards\n 3 Months of advice\n 1 Shopping list" }
])

open_file = Proc.new {|path, name| File.open(File.join(Rails.root, path, name))}
item_path = "db/fixtures/assets/images/items/"

Art.seed(:id, [
  { :id => 1, :title => 'Black & White Photography',  :photo => open_file.call(item_path, "step3_art1.jpg")},
  { :id => 2, :title => 'Classic Impressionist',      :photo => open_file.call(item_path, "step3_art2.jpg") },
  { :id => 3, :title => 'Pop Art',                    :photo => open_file.call(item_path, "step3_art3.jpg") },
  { :id => 4, :title => 'Framed Family Photos',       :photo => open_file.call(item_path, "step3_art4.jpg") },
  { :id => 5, :title => 'Sculptures & Objects',       :photo => open_file.call(item_path, "step3_art5.jpg") },
  { :id => 6, :title => 'Modern or Abstract',         :photo => open_file.call(item_path, "step3_art6.jpg") },
  { :id => 7, :title => 'Whimsical',                  :photo => open_file.call(item_path, "step3_art7.jpg") }
])

Furniture.seed(:id, [
  { :id => 8,  :title => 'Silvers (Steel, Nickel, Chrome)', :photo => open_file.call(item_path, "step3_material1.jpg") },
  { :id => 9,  :title => 'Plastics',                        :photo => open_file.call(item_path, "step3_material2.jpg") },
  { :id => 10, :title => 'Wrought Iron',                    :photo => open_file.call(item_path, "step3_material3.jpg") },
  { :id => 11, :title => 'Glass',                           :photo => open_file.call(item_path, "step3_material4.jpg") },
  { :id => 12, :title => 'Gold',                            :photo => open_file.call(item_path, "step3_material5.jpg") }
])

Shop.seed(:id, [
  { :id =>13, :title => 'Target' },
  { :id =>14, :title => 'Walmart' },
  { :id =>15, :title => "Costco or Sam's Club" },
  { :id =>16, :title => 'Overstock.com' },
  { :id =>17, :title => 'ACE Hardware' },
  { :id =>18, :title => 'Home Depot' },
  { :id =>19, :title => "Lowe's" },
  { :id =>20, :title => 'World Market' },
  { :id =>21, :title => 'Pier 1 Imports' },
  { :id =>22, :title => 'IKEA' },
  { :id =>23, :title => 'Bed, Bath & Beyond' },
  { :id =>24, :title => 'Sears' },
  { :id =>25, :title => 'Pottery Barn' },
  { :id =>26, :title => 'Room & Board' },
  { :id =>27, :title => 'West Elm' },
  { :id =>28, :title => 'Crate & Barrel or CB2' },
  { :id =>29, :title => 'Z Gallerie' },
  { :id =>30, :title => "Macy's" },
  { :id =>31, :title => 'Restoration Hardware' },
  { :id =>32, :title => 'Ethan Allen' },
  { :id =>33, :title => 'Etsy.com' },
  { :id =>34, :title => 'Local Boutiques or Independent Retailers' }
])

ColorSet.seed(:id, [
  { :id => 35, :title => "Nature colors",   :description => "greens and browns",                     :photo => open_file.call(item_path, "step3_color1.jpg") },
  { :id => 36, :title => "Dramatic colors", :description => "rich burgundies and deep blues",        :photo => open_file.call(item_path, "step3_color2.jpg") },
  { :id => 37, :title => "Bold colors",     :description => "oranges, bright greens, bright reds",   :photo => open_file.call(item_path, "step3_color3.jpg") },
  { :id => 38, :title => "Neutral colors",  :description => "earth tones, beige, gray ",             :photo => open_file.call(item_path, "step3_color4.jpg") },
  { :id => 39, :title => "Soft colors",     :description => "pastels, yellows, peach and pale blue", :photo => open_file.call(item_path, "step3_color5.jpg") }
])

WoodType.seed(:id, [
  { :id => 40, :title => "Maple, stained black or cherry",  :photo => open_file.call(item_path, "step3_wood1.jpg") },
  { :id => 41, :title => "Oak or chestnut",                 :photo => open_file.call(item_path, "step3_wood2.jpg") },
  { :id => 42, :title => "Mahogany",                        :photo => open_file.call(item_path, "step3_wood3.jpg") },
  { :id => 43, :title => "Knotted Pine",                    :photo => open_file.call(item_path, "step3_wood4.jpg") },
  { :id => 44, :title => "Bamboo",                          :photo => open_file.call(item_path, "step3_wood5.jpg") }
])

Fabric.seed(:id, [
  { :id => 45, :title => "Silk.",            :description => "Beautifull and luxurious.",   :photo => open_file.call(item_path, "step3_fabric1.jpg") },
  { :id => 46, :title => "Leather.",         :description => "Rustic and classic",          :photo => open_file.call(item_path, "step3_fabric2.jpg") },
  { :id => 47, :title => "Microsuede.",      :description => "Durable and resists stains.", :photo => open_file.call(item_path, "step3_fabric3.jpg") },
  { :id => 48, :title => "Cotton or Linen.", :description => "A natural woven fabric.",     :photo => open_file.call(item_path, "step3_fabric4.jpg") }
])

LifePhase.seed(:id, [
  { :id => 49, :title => 'Student' },
  { :id => 50, :title => 'Recent Grad' },
  { :id => 51, :title => 'Young Professional' },
  { :id => 52, :title => 'Newly Married' },
  { :id => 53, :title => 'Expecting' },
  { :id => 54, :title => 'Parent with Young Kids' },
  { :id => 55, :title => 'Independent Adult' },
  { :id => 56, :title => 'Recent Empty Nester' },
  { :id => 57, :title => 'Retiree' },
  { :id => 59, :title => 'Other' }
])

ProjectApproach.seed(:id, [
  { :id => 60, :title => 'Looking for least work to do myself' },
  { :id => 61, :title => "Enlist some friends' help" },
  { :id => 62, :title => 'Hire someone to help' },
  { :id => 63, :title => 'Willing to take on a challenge on my own' }
])

BudgetType.seed(:id, [
  { :id => 64, :title  => 'Tight',    :description => 'Tight. I am interested in seeing a big improvement based on a very small investment.' },
  { :id => 65, :title  => 'Average',  :description => 'Average. I have some money set aside for this project and feel I can cover typical material/furnishing costs.' },
  { :id => 66, :title  => 'Flexible', :description => 'Flexible. I am willing to invest a lot in quality and style if it reflects my personality and needs.' }
])
