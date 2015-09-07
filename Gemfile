source :rubygems

gem 'rails', '3.2'
gem 'pg'
gem 'activeadmin'

group :assets do
  gem 'haml-rails'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'jquery-rails'
  gem 'compass-rails'
  gem 'compass_twitter_bootstrap'
  gem 'uglifier'
end

#authorize and authenticate
gem 'cancan'
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google'

#crud
gem 'inherited_resources'

#views
gem 'haml'
gem 'sass'
gem 'simple_form', '1.5.2'
gem 'nested_form'
gem 'ckeditor'

#misc
gem 'kaminari'
gem 'carrierwave'
gem 'rmagick'
gem 'simple-navigation'
gem 'state_machine'
gem 'money-rails'
gem 'seed-fu'
gem 'wicked'
gem "meta_search", '>= 1.1.0.pre' #need for active admin

#payment
gem 'braintree'

# FIXME: remove?!
gem 'hpricot'
gem 'ruby_parser'
gem 'configatron'

# MailChimp
gem 'gibbon'

group :development do
  gem 'annotate', '2.4.1.beta1'
  gem 'rvm-capistrano'
  gem 'capistrano', :require => false
  gem 'capistrano-ext', :require => false
  gem 'capistrano_colors'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'pry'
  gem 'factory_girl_rails'
  gem 'faker'
  #instead of node.js
  gem 'therubyracer'

  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
  gem 'unicorn'
end
