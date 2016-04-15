Pod::Spec.new do |s|
  s.name         = "SimpleBubbleTransition"
  s.version      = "0.0.1"
  s.summary      = "Just provide a simple bubble transition, easy to use."
  s.homepage     = "https://github.com/jacoli/SimpleBubbleTransition"
  s.license      = "MIT"
  s.authors      = { "jacoli" => "luckylcg@163.com" }
  s.source       = { :git => "https://github.com/jacoli/SimpleBubbleTransition.git", :tag => "0.0.1" }
  s.frameworks   = 'Foundation', 'UIKit'
  s.platform     = :ios, '7.0'
  s.source_files = 'SimpleBubbleTransition/*.{h,m}'
  s.requires_arc = true
end
