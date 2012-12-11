require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rspec_opts = ['--color', '-fs']
  end
rescue LoadError => e
  $stderr.puts "rspec/core is missing"
end

task :default => [:spec]
