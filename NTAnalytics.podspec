Pod::Spec.new do |s|
  s.name         = "NTAnalytics"
  s.version      = "0.14"
  s.summary      = "NTAnalytics - A Provider-based system to integrate Analytics systems such at Flurry or Google Analytics"
  s.homepage     = "https://github.com/NagelTech/NTAnalytics"
  s.license      = { :type => 'MIT', :file => 'license.txt' }
  s.author       = { "Ethan Nagel" => "eanagel@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/NagelTech/NTAnalytics.git", :tag => "0.14" }
  s.source_files = 'NTAnalytics.h', 'NTAnalyticsEvent.{h,m}', 'NTAnalyticsManager.{h,m}', 'NTAnalyticsTimedEvent.{h,m}'
  s.requires_arc = true
end
