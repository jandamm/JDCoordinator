Pod::Spec.new do |s|
  s.name         = "JDCoordinator"
  s.version      = "0.6"
  s.summary      = "Library for easier implementation of the coordinator concept by @khanlou."
  s.homepage     = "http://jandamm.de"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Jan Dammshäuser" => "jandammshaeuser@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/charmaex/JDCoordinator.git", :tag => "#{s.version}" }
  s.requires_arc = true

  s.source_files  = "JDCoordinator/**/*.{swift}"
end
