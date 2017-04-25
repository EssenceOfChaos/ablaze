source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

## Included Gems ##
gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


## Added Gems ##
gem 'mongoid', '~> 6.1.0'
gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'
gem 'devise'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem "paperclip", "~> 5.0.0"
gem "mongoid-paperclip"
gem 'will_paginate', '~> 3.1.0'
gem "will_paginate_semantic_ui"
gem "will_paginate_mongoid"
gem 'omniauth-linkedin-oauth2', git: 'https://github.com/Devato/omniauth-linkedin-oauth2.git'
gem 'omniauth-twitter'
gem 'omniauth-digitalocean'
source 'https://rails-assets.org' do
  gem 'rails-assets-datetimepicker'
end


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rspec-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
