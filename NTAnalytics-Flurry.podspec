Pod::Spec.new do |s|
  s.name         = "NTAnalytics-Flurry"
  s.version      = "0.14"
  s.summary      = "NTAnalytics-Flurry - Flurry Provider for NTAlanlytics"
  s.homepage     = "https://github.com/NagelTech/NTAnalytics"
  s.license      = { :type => 'MIT', :file => 'license.txt' }
  s.author       = { "Ethan Nagel" => "eanagel@gmail.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/NagelTech/NTAnalytics.git", :tag => "0.14" }
  s.source_files = 'NTAnalyticsFlurryProvider.{h,m}'
  s.requires_arc = true
  
  s.dependency 'NTAnalytics', '~> 0.14'
end
