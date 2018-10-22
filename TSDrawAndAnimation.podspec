#
#  Be sure to run `pod spec lint TSDataPersistence.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
Pod::Spec.new do |s|

  s.name         = "TSDrawAndAnimation"
  s.version      = "2.0.0"
  s.summary      = "TSDrawAndAnimation"
  s.description  = <<-DESC
            TSDrawAndAnimation For View And Layer
                   DESC
  s.homepage     = "https://gitlab.caiqr.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Paul" => "zhangjunjie@caiqr.com" }
 
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "http://gitlab.caiqr.com/ios_module/TSDrawAndAnimation.git", :tag => "#{s.version.to_s}" }
  s.source_files = "TSDrawAndAnimation/Classes/*"
  s.framework  = "UIKit","Photos"
  s.swift_version = '4.2'
  s.requires_arc = true

end
