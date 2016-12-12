Pod::Spec.new do |s|
  s.name         = "JDCoordinator"
  s.version      = "0.3.5"
  s.summary      = "JDCoordinator. See Demo Project for usage."
  s.homepage     = "http://jandamm.de"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jan Dammshäuser" => "jandammshaeuser@me.com" }
  s.platform     = :ios
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/charmaex/JDCoordinator.git", :tag => "#{s.version}" }
  s.requires_arc = true

  s.source_files  = "JDCoordinator/**/*.{swift}"
end
