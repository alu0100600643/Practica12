$:.unshift File.dirname(__FILE__) + 'lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec


desc "Run lib/matriz.rb"
task :bin do
  sh "ruby lib/matriz.rb"
end

desc "Run test with --format documentation"
task :spec_local do
   sh "rspec -I. spec/rspec_p8_spec.rb --format documentation"
end

desc "Run test with format: html"
 task:thtml do
    sh" rspec -I. spec/rspec_p8_spec.rb --format html"
 end
