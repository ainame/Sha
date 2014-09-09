# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
  require 'sugarcube-color'
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'shya-nashi-yade'
  app.identifier = 'jp.co.mixi.MayChannel.inhouse'
  app.codesign_certificate = 'iPhone Developer: Satoshi Namai (ESRQ662FUC)'
  app.provisioning_profile = '/Users/satoshi.namai/Library/MobileDevice/Provisioning Profiles/DDBD9E9B-8A5C-4958-B532-0D85EFF5B6D9.mobileprovision'
  app.info_plist['UIMainStoryboardFile'] = 'Storyboard'
  app.frameworks += ['AudioToolbox']
end
