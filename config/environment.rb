# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:custom_datetime] = "%d.%m.%Y %T"
