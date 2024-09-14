
Pod::Spec.new do |s|
  s.name         = "RNHinaReactNativeAbtest"
  s.version      = "1.0.0"
  s.summary      = "RNHinaReactNativeAbtest"
  s.description  = <<-DESC
                  RNHinaReactNativeAbtest
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/author/RNHinaReactNativeAbtest.git", :tag => "master" }
  s.source_files  = "RNHinaReactNativeAbtest/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  