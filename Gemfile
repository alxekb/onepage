source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap',  '~>4.3.1'
gem 'doorkeeper', '~> 5.2'
gem 'draper', '~> 3.1'
gem 'faker'
gem 'fast_jsonapi', '~> 1.5'
gem 'grape', '~> 1.2', '>= 1.2.5'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 4.1'
gem 'rack-cors', '~> 1.1'
gem 'rails', '~> 6.0.1'
gem 'react-rails'
gem 'slim', '~> 4.0', '>= 4.0.1'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
