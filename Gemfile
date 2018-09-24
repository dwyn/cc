source 'https://rubygems.org'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

gem 'omniauth-github'
gem 'devise', '~> 4.4.3'
gem 'bootstrap', '~> 4.0.0'
gem 'pry-rails'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
# gem 'turbolinks', '~> 5' // will reinstall later. // = require turbolinks
gem 'jbuilder', '~> 2.5'
gem 'active_model_serializers'
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]