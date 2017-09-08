Pod::Spec.new do |s|
  s.name         = "PulsingHalo"
  s.version      = "0.2.8"
  s.platform     = :ios
  s.ios.deployment_target  = '8.0'
  s.summary      = "iOS Component to create Pulsating Animations."
  s.homepage     = "https://github.com/shu223/PulsingHalo"
  s.license      = 'MIT'
  s.author       = { "shu223" => "shuichi0526@gmail.com" }
  s.source       = { :git => "https://github.com/shu223/PulsingHalo.git", :tag => "0.2.8" }
  s.source_files  = 'PulsingHalo/*.{h,m}'
  s.framework  = 'QuartzCore'
  s.requires_arc = true
end
