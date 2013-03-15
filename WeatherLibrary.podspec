Pod::Spec.new do |s|
s.platform     = :ios, '5.0'
  s.name         = "WeatherLibrary"
  s.version      = "0.0.1"
  s.summary      = "A library which implements a very basic subset of Weather Underground API."
  s.homepage     = "https://github.com/jgimenez/CocoaPodsWeatherLibrary"
  s.license      = 'MIT'
  s.author       = 'Jordi Giménez'
  s.source       = { :git => "https://github.com/jgimenez/CocoaPodsWeatherLibrary.git", :tag => "0.0.1" }
  s.source_files = 'WeatherLibrary/*.{h,m}'
  s.frameworks = 'SystemConfiguration', 'MobileCoreServices'
  s.requires_arc = true
  s.dependency 'AFNetworking'
  s.dependency 'JTObjectMapping'
end
