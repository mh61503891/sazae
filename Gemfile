source 'https://rubygems.org'



gem 'rails', '4.2.3'

group :development, :test do
  gem 'sqlite3'
end
group :staging, :production do
  gem 'mysql2'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

group :staging, :production do
  gem 'therubyracer', platforms: :ruby
end

gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'autosize-rails'

gem 'jbuilder', '~> 2.0'

group :development, :test do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'pry-doc', require: false
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'awesome_print'
end

group :development do
  gem 'bullet'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rack-mini-profiler'
  gem 'annotate'
end

# for deploy
group :development do
  gem 'capistrano', '~> 3.1', require: false
  gem 'capistrano-bundler', '~> 1.1.2', require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-passenger'
  gem 'capistrano-rails-console'
end

