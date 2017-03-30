# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.production?
  ENV[DISABLE_DATABASE_ENVIRONMENT_CHECK]=1
end
