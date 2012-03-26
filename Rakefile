#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  # t.pattern = "./spec/**/*_spec.rb" # default
  # Put spec opts in a file named .rspec in root
end

desc "Run the specs"
task :default => ["spec"]
