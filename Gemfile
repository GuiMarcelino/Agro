source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.8", ">= 7.0.8.4"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem 'active_model_serializers', '~> 0.10.0'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker'
  gem "shoulda-matchers"
end

group :development do
end

