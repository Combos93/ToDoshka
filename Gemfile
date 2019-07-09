source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.3'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'simple_form'
gem 'devise'
gem 'i18n'
gem 'turbolinks'

gem 'pg'

group :assets do
  gem 'sass-rails', '~> 5.0'
#  gem 'uglifier'
  gem 'coffee-rails', '~> 4.2'
  gem 'mini_racer', platform: :ruby
end


# gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'capistrano-rails', group: :development
end
