Braintree::Configuration.environment = SETTINGS[Rails.env]["braintree"]["env"].to_sym
Braintree::Configuration.merchant_id = SETTINGS[Rails.env]["braintree"]["merchant_id"]
Braintree::Configuration.public_key  = SETTINGS[Rails.env]["braintree"]["public_key"]
Braintree::Configuration.private_key = SETTINGS[Rails.env]["braintree"]["private_key"]