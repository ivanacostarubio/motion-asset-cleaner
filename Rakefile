# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require './lib/motion-asset-cleaner'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-asset-cleaner'
end

task :test do 
  print `sh spec/test_rm_asset_cleaner.sh`
end
