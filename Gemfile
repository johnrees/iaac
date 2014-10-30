ruby "2.1.4"
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.beta2'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

gem 'normalize-rails'
gem 'figaro', github: 'laserlemon/figaro'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'paper_trail'
gem 'launchy'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'
# Use CoffeeScript for .js.coffee assets and views
gem 'countries'
gem 'country_select'
gem 'coffee-rails', '~> 4.0.0'
gem 'rolify'
gem 'responders'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jQuery as the JavaScript library
gem 'jquery-rails', '~> 4.0.0.beta2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'pundit'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'closure_tree'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'brakeman'
end

group :test do
  gem 'simplecov', require: false
  gem 'zonebie'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'database_cleaner'
  # gem "codeclimate-test-reporter", require: nil
end

group :development do
  # gem 'ruby-graphviz', '~> 1.0.0'
  gem 'guard-rspec', require: false
  gem 'letter_opener'
end

group :development, :test do

  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0.0.beta4'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

