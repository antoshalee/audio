source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'json'
gem 'pg'
gem 'haml'
gem 'haml-rails'
gem 'ransack'
gem 'thinking-sphinx', '2.1.0'
gem 'sass-rails', '~> 4.0.0'
gem 'simple_form'
gem 'russian'
gem 'wicked'
gem 'draper'
gem 'has_scope'
gem 'acts_as_list'
gem 'carrierwave'
gem 'capistrano', "2.15.5"
gem 'rmagick', '~> 2.13.2'
gem 'whenever', require: false
gem 'active_admin_editor'

# CanCan is not ready for Rails 4.. let try it anyway
gem 'cancan'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'less-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

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
gem 'enumerize'

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
gem 'unicorn'
