require 'sinatra/activerecord/rake'
require './app'


desc 'Start IRB with application environment loaded'
task 'console' do
  exec 'irb -r ./app.rb'
end

desc "create the database"
task "db:create" do
  %x(createdb hoodang_development)
end

desc "drop the database"
task "db:drop" do
  %x(dropdb hoodang_development)
end

desc "drop and re-create the database"
task "db:reset" do
  %x(rake db:drop)
  %x(rake db:create)
end

task :environment do
  require './app'
end

Rake::Task["db:migrate"].enhance [:environment]
Rake::Task["db:rollback"].enhance [:environment]
