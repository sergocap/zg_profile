source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'attribute_normalizer'
gem 'awesome_print'
gem 'bootstrap-sass'
gem 'cancan'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'glyphicons-rails'
gem 'gravtastic'
gem 'inherited_resources'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'omniauth-mailru', git: 'https://github.com/sergocap/omniauth-mailru'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'
gem 'omniauth-yandex'
gem 'openteam-commons'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-session-store'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'zg_header', git: 'https://github.com/sergocap/zg_header'
gem 'zg_redis_user_connector', git: 'https://github.com/sergocap/zg_redis_user_connector'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-ui-bootstrap'
  gem 'rails-assets-jquery-ui'
end

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
