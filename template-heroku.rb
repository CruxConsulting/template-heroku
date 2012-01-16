# new rails apps basic template

# Add to gemfile:
gem "jquery-rails"
gem "devise"
gem "airbrake"
gem "carrierwave"

# Group test:
gem "guard-rspec", :group => :test
gem "factory_girl", :group => :test
gem "spork", :group => :test
gem "guard-spork", :group => :test

# Group test & development
gem "rspec-rails", :group => [:test, :development]
gem "remarkable_activerecord", :group => [:test, :development]

# Run bundler
#############

run "bundle install"

# gems generators

generate "devise:install"
run "guard init rspec"
run "spork --bootstrap"

# git initial commit

git :init
git :add => "."
git :commit => "-m initial"

# Deploy on heroku

run "heroku create --stack cedar"
run "git push heroku master"
run "heroku run rake db:migrate"