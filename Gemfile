source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'sqlite3'
gem 'pg'
gem 'haml'
gem 'ransack'
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use AASM instead of state_machine
# due to the latter is not ready for Rails4
gem 'aasm'

gem "devise", "~> 3.0.3"

gem 'kaminari'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'capybara'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
end

group :test do
  gem 'rake' # travis requires it
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
