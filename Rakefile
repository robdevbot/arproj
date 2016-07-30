require 'rake'
require 'rspec/core/rake_task'

require_relative "config/environment"


task "db:create" do
  touch DB_PATH
end

task "db:drop" do
  rm_f DB_PATH
end

task "db:rollback" do
  number_of_steps = (ENV['STEP'] || 1).to_i
  test_thread = ENV['AR_ENV'] == 'test' ? nil : Thread.new { `bundle exec rake db:rollback STEP=#{number_of_steps} AR_ENV=test` }

  ActiveRecord::Migrator.rollback('db/migrate', number_of_steps)

  test_thread.join if test_thread

end

task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
end

task "db:seed" do
  require APP_ROOT.join('db', 'seeds.rb')
end


namespace :generate do
  task :migration do
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path = APP_ROOT.join('db', 'migrate', filename)
    name = ENV['NAME'].camelize

migration_template = <<-MIGTEMP
class #{name} < ActiveRecord::Migration
  def change
  end
end
MIGTEMP

    File.open(path, "w") { |file| file.write(migration_template) }
  end

  task :model do
    name = ENV['NAME'].camelize
    filename = "%s.rb" % [name.underscore]
    path = APP_ROOT.join('app', 'models', filename)

model_template = <<-MODTEMP
class #{name} < ActiveRecord::Base
end
MODTEMP

    File.open(path, "w") { |file| file.write(model_template) }

  end
end

task "console" do
  exec "irb -r./config/environment"
end

task "spec" do
  RSpec::Core::RakeTask.new(:spec)
end


