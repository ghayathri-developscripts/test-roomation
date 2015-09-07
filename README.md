## Setup
  
  bundle install
  
  rake db:create
  rake db:migrate
  rake db:seed_ru

## Create Facebook Application
Go to https://developers.facebook.com/apps and create a new application, let's call it 'Roomation'
Set your local project URL as application's url in it's settings, for example http://0.0.0.0:3000/

## Create Twitter Application
Go to https://dev.twitter.com/apps and create a new application, again let's call it 'Roomation'
Set your local project URL as application's url in it's settings, for example http://0.0.0.0:3000/
Set 'Callback URL' for application as follows: http://0.0.0.0:3000/auth/twitter/callback

## Create Google Application dont do this now
Go to https://code.google.com/apis/console/ and create a new application

Go to API Access and configure application's name and URL settings:
Authorized Redirect URLs: http://0.0.0.0:3000/auth/google/callback
Authorized JavaScript Origins: https://0.0.0.0:3000

## Update your local environment settings
Edit your /config/initializers/devise.rb
Scroll to OmniAuth section of initializer
Put correct values into corresponding placeholders for Facebook and Twitter applications: application ids and application secrets

For unknown reason declaring ENV[] variables in /config/environment/development.rb doesn't work for Devise initializers

## Restart your web server (note the port!)
bundle exec rails s
