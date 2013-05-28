source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'twitter-bootstrap-rails'
gem 'haml-rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem "pg" # Heroku doesn't do SQLite
end

gem 'carrierwave'
gem 'mini_magick'
gem 'cloudinary'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'database_cleaner', '0.8.0'

  # Generating faked data or objects
  gem 'factory_girl_rails', '4.1.0'
  gem 'faker', '1.1.1'

  # Pry for debug
  gem 'pry-rails', '0.2.2'
  gem 'pry-debugger', '0.2.1'
  gem 'pry-remote', '0.1.6' # connect to pry remotely when running foreman
end

group :test do
  gem 'capybara', '2.0.2'
  gem 'capybara-webkit', '0.14.2'
  gem 'shoulda-matchers', '2.0.0'
end

group :development do
  # Use Guard + Addons for automated test runs
  gem 'guard', '1.7.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.5.0'
  gem 'growl', '1.0.3'
  gem 'rb-fsevent', '~> 0.9.1' # guard dependency

  gem 'quiet_assets', '1.0.1' # supress log entries for assets in dev

  # better error pages in dev
  gem 'better_errors', '0.3.2'
  gem 'binding_of_caller', '0.6.8'
end
