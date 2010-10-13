#!/usr/bin/env ruby
$:.unshift File.join(File.dirname(__FILE__), 'test') unless $:.include? File.join(File.dirname(__FILE__), 'test')

require 'rake'
require 'rake/testtask'

task :default => 'test'

Rake::TestTask.new(:test) do |t|
  t.libs << '.' << 'lib' << 'test'
  t.pattern = 'test/lib/**/*_test.rb'
  t.verbose = false
end

